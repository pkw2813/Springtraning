package com.kh.finalProject.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.student.model.service.StudentService3;
import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.StuTuition;


@Controller
public class StudentController3 {

	@Autowired
	private StudentService3 service;
	
	@RequestMapping("/student/tuitionBill.hd")
	public String selectTuition(HttpSession session, Model model) {
		System.out.println("/student/tuitionBill.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String semester="";
		if(todayMonth>=1&&todayMonth<=6) {
			semester="01";
		}else if(todayMonth>=7&&todayMonth<=12) {
			semester="02";
		}
		
		String acaYearSem=today.substring(0, 4)+"-"+semester;
		System.out.println("acaYearSem:"+acaYearSem);
		
		tuition.setAcaYearSem(acaYearSem);
		StuTuition student=service.selectBasicStudentInfo(studentNo);
		if(student.getStuAddr()!=null&&student.getStuAddr().contains("PSTC")&&student.getStuAddr().split("PSTC").length==2) {
			student.setStuPostcode(student.getStuAddr().split("PSTC")[0]); // 우편번호 저장
		}else {
			student.setStuPostcode(""); // 우편번호 저장
		}
		StuTuition result=service.selectTuitionOne(tuition);
		System.out.println("result:"+result);
		model.addAttribute("student", student); // 학생 기본 정보 보내기
		model.addAttribute("tuition", result);
		
		return "student/studentTuition";
	}
	
	
	@RequestMapping("/student/tuitionCert.hd")
	public String selectTuitionCert(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("/student/tuitionCert.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		String selectYearSem="";
		String selectYearSemKor="";
		
		List<StuTuition> tuitionCertList=service.selectTuitionCertList(studentNo);
		for(int i=0; i<tuitionCertList.size(); i++) {
			String acaYear=tuitionCertList.get(i).getAcaYearSem().substring(0, 4);
			System.out.println("학년도:"+acaYear);
			int tcListLength=tuitionCertList.get(i).getAcaYearSem().length();
			String semester=tuitionCertList.get(i).getAcaYearSem().substring(tcListLength-2, tcListLength);
			System.out.println("학기:"+semester);
			tuitionCertList.get(i).setAcaYearSemKor(acaYear+"학년도 "+semester+"학기");
			if(i==0) {
				selectYearSem=acaYear+"-"+semester; // 가장 최근의 학년 학기만 저장
				selectYearSemKor=acaYear+"학년도 "+semester+"학기"; // 가장 최근의 학년 학기만 저장
			}
		}
		System.out.println("tuitionCertList:"+tuitionCertList);
		model.addAttribute("tuitionCertList", tuitionCertList);
		
		System.out.println("로그인한 아이디:"+studentNo);
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		tuition.setAcaYearSem(selectYearSem);
		StuTuition student=service.selectBasicStudentInfo(studentNo);
		if(student.getStuAddr()!=null&&student.getStuAddr().contains("PSTC")&&student.getStuAddr().split("PSTC").length==2) {
			student.setStuPostcode(student.getStuAddr().split("PSTC")[0]); // 우편번호 저장
		}else {
			student.setStuPostcode(""); // 우편번호 저장
		}
		StuTuition result=service.selectTuitionOne(tuition);
		System.out.println("result:"+result);
		model.addAttribute("student", student); // 학생 기본 정보 보내기
		model.addAttribute("tuition", result);
		model.addAttribute("selectYearSemKor", selectYearSemKor);
		
		return "student/studentTuitionCert";
	}
	
	@RequestMapping("/student/tuitionCertAjax.hd")
	@ResponseBody
	public String selectTuitionByAjax(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		// @ResponseBody이용 jackson
		System.out.println("/student/tuitionCertAjax.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		String selectYearSem="";
		selectYearSem=req.getParameter("selectYearSem");
		System.out.println("ajax로 입력받은 selectYearSem:"+selectYearSem);
		
		tuition.setAcaYearSem(selectYearSem);
		
		ObjectMapper mapper=new ObjectMapper();
		StuTuition result=service.selectTuitionOne(tuition);
		String jsonStr="";
		  try {
			jsonStr=mapper.writeValueAsString(result); // 매개변수에 배열도 들어갈 수 있다!! 매우 편리하다!! 자바스크립트 객체 형식으로 변환 해준다.
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  res.setContentType("application/json;charset=utf-8"); // 인코딩 설정하기
		return jsonStr;
	}
	
	@RequestMapping("/student/payTuitionAjax.hd")
	@ResponseBody
	public String payTuitionByAjax(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("/student/payTuitionAjax.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		String acaYearSem="";
		acaYearSem=req.getParameter("acaYearSem");
		System.out.println("ajax로 입력받은 acaYearSem:"+acaYearSem);
		tuition.setAcaYearSem(acaYearSem);
		System.out.println("update이전:"+tuition);
		int result=service.updateTuitionOne(tuition);
		
		String resultStr="";
		if(result>=1) {
			resultStr="업데이트 성공";
		}else if(result==0) {
			resultStr="업데이트 실패";
		}
		System.out.println("resultStr:"+resultStr);
		
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		  try {
			jsonStr=mapper.writeValueAsString(resultStr); // 매개변수에 배열도 들어갈 수 있다!! 매우 편리하다!! 자바스크립트 객체 형식으로 변환 해준다.
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  res.setContentType("application/json;charset=utf-8"); // 인코딩 설정하기
		return jsonStr;
	}
}
