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
import com.kh.finalProject.student.model.vo.Request;
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
				
		List<Grade> gradeAll = service.selectGradeAll(stuNo);
		for(int i=0; i<gradeAll.size(); i++) {
			String grade=gradeAll.get(i).getGrade();
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
			
						
			gradeAll.get(i).setGrade(grade);
		}
			
		for(Grade e : gradeAll) {
			if(!deptCode.equals(e.getSubCode().substring(0,3)) && (e.getSubType().equals("전공선택")||e.getSubType().equals("전공필수"))) {
				e.setSubType("타전공");
				System.out.println("전체학기 성적 타전공 분류"+e);
			}
		}
		model.addAttribute("gradeAll", gradeAll);
		System.out.println("전체학기 성적"+gradeAll);
		List<Map> gradeSubType = service.gradeSearchSubType(stuNo);
		model.addAttribute("gradeSubType",gradeSubType);
		return "student/gradeSearchAll";	
	}
	
	
	
	//페이지 전환용
	@RequestMapping("/student/gradeSearchNow.hd")
	public String gradeSerachNow(HttpSession session, Model model) {
		Student student = (Student)session.getAttribute("loginMember");
		String stuNo=student.getStuNo();
		String deptCode=student.getStuNo().substring(5,8);
		List<Grade> gradeAll = service.selectGradeAll(stuNo); // 현재: 2019학년도 2학기
		List<Grade> gradeNow = new ArrayList();
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
		
		for(int i=0; i<gradeAll.size(); i++) {
			String grade=gradeAll.get(i).getGrade();
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
			gradeAll.get(i).setGrade(grade);
		}
			for(Grade e : gradeAll) {
					if(!deptCode.equals(e.getSubCode().substring(0,3)) && (e.getSubType().equals("전공선택")||e.getSubType().equals("전공필수"))) {
						e.setSubType("타전공");
						System.out.println("현재학기 타전공 분류"+e);
					}
			}
			for(int j=0; j<gradeAll.size(); j++) {
				if(acaYearSem.equals(gradeAll.get(j).getAcaYearSem())) {
					gradeNow.add(gradeAll.get(j));
					System.out.println("출력!"+gradeAll.get(j).getAcaYearSem());
					System.out.println("list!!"+gradeAll.get(j));
					System.out.println("현재학기꺼만"+gradeNow);
					
				}				
			}
			model.addAttribute("gradeNow", gradeNow);
		return "student/gradeSearchNow";
	}
	
	@RequestMapping("/myAppeal.hd")
	public String insertAppeal(Request request, HttpSession session, Model model) {
		
		System.out.println("나옴?"+request);		
		int result = service.insertAppeal(request);
		String msg="";
		String loc="/student/gradeSearchNow.hd";
		if(result>0) {
			msg="이의신청완료";
		} else {
			msg="이의신청실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
//		return "redirect:/gradeSearchNow.jsp";
		
	}
	
}
