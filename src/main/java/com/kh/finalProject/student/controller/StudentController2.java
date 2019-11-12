package com.kh.finalProject.student.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.student.model.service.StudentService2;
import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.Student;


@Controller
public class StudentController2 {

	@Autowired
	private StudentService2 service;
	
	//페이지 전환용
	@RequestMapping("/student/gradeSearchAll.hd")
	public String gradeSearchAll(HttpSession session, Model model) {
		Student student = (Student)session.getAttribute("loginMember");
		String stuNo=student.getStuNo();
		String deptCode=student.getStuNo().substring(5,8);
				
		List<Grade> list = service.selectGradeAll(stuNo);
		for(int i=0; i<list.size(); i++) {
			String grade=list.get(i).getGrade();
			if(grade.equals("4.5")) {
				grade="A+";
			} else if(grade.equals("4.0")) {
				grade="A";
			} else if(grade.equals("3.5")) {
				grade="B+";
			} else if(grade.equals("3.0")) {
				grade="B";
			} else if(grade.equals("2.5")) {
				grade="C+";
			} else if(grade.equals("2.0")) {
				grade="C";
			} else if(grade.equals("1.5")) {
				grade="D+";
			} else if(grade.equals("1.0")) {
				grade="D";
			} else if(grade.equals("0") || grade.equals("F")) {
				grade="F";
			} else if(grade.equals("P")){
				grade="P";
			}
			
						
			list.get(i).setGrade(grade);
		}
			
		for(Grade e : list) {
			if(!deptCode.equals(e.getSubCode().substring(0,3)) && (e.getSubType().equals("전공선택")||e.getSubType().equals("전공필수"))) {
				e.setSubType("타전공");
				System.out.println("전체학기 성적 타전공 분류"+e);
			}
		}
		model.addAttribute("list", list);
		System.out.println("전체학기 성적"+list);
		List<Map> list1 = service.gradeSearchSubType(stuNo);
		model.addAttribute("list1",list1);
		return "student/gradeSearchAll";	
	}
	
	
	
	//페이지 전환용
	@RequestMapping("/student/gradeSearchNow.hd")
	public String gradeSerachNow(HttpSession session, Model model) {
		Student student = (Student)session.getAttribute("loginMember");
		String stuNo=student.getStuNo();
		String deptCode=student.getStuNo().substring(5,8);
		List<Grade> list = service.selectGradeAll(stuNo); // 현재: 2019학년도 2학기
		List<Grade> list2 = new ArrayList();
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String semester="";
		if(todayMonth>=1&&todayMonth<=6) {
			semester="1";
		}else if(todayMonth>=7&&todayMonth<=12) {
			semester="2";
		}
		
		String acaYearSem=today.substring(0, 4)+"-"+semester;
		System.out.println("acaYearSem:"+acaYearSem);
		System.out.println("deptCode"+deptCode);
		
		for(int i=0; i<list.size(); i++) {
			String grade=list.get(i).getGrade();
			if(grade.equals("4.5")) {
				grade="A+";
			} else if(grade.equals("4.0")) {
				grade="A";
			} else if(grade.equals("3.5")) {
				grade="B+";
			} else if(grade.equals("3.0")) {
				grade="B";
			} else if(grade.equals("2.5")) {
				grade="C+";
			} else if(grade.equals("2.0")) {
				grade="C";
			} else if(grade.equals("1.5")) {
				grade="D+";
			} else if(grade.equals("1.0")) {
				grade="D";
			} else if(grade.equals("0") || grade.equals("F")) {
				grade="F";
			} else if(grade.equals("P")){
				grade="P";
			}		
			list.get(i).setGrade(grade);
		}
			for(Grade e : list) {
					if(!deptCode.equals(e.getSubCode().substring(0,3)) && (e.getSubType().equals("전공선택")||e.getSubType().equals("전공필수"))) {
						e.setSubType("타전공");
						System.out.println("현재학기 타전공 분류"+e);
					}
			}
			for(int j=0; j<list.size(); j++) {
				if(acaYearSem.equals(list.get(j).getAcaYearSem())) {
					list2.add(list.get(j));
					System.out.println("출력!"+list.get(j).getAcaYearSem());
					System.out.println("list!!"+list.get(j));
					System.out.println("현재학기꺼만"+list2);
					
				}				
			}
			model.addAttribute("list2", list2);
		return "student/gradeSearchNow";
	}
	
	
	
}
