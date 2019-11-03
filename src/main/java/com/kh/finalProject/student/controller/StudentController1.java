package com.kh.finalProject.student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.finalProject.student.model.service.StudentService1;
import com.kh.finalProject.student.model.vo.Student;


@Controller
public class StudentController1 {
	
	@Autowired
	private StudentService1 service;
		
	@RequestMapping("/student/studentInfo.hd")
	public String selectStudent(HttpSession session,Model m) {
		/* Student s=(Student)session.getAttribute("loginMember"); */
		String studentNo="SA0012019001";
		Student s=service.selectStudent(studentNo);
		m.addAttribute("student",s);
	
		return "student/studentInfo";
		
		
	}
	
	@RequestMapping("/student/studentInfoUpdate.hd")
	public String studentInfoUpdate(Model m) {
		String studentNo="SA0012019001";
		Student s=service.selectStudent(studentNo);
		m.addAttribute("student",s);
		return "student/studentInfoUpdate";
	}
	
	@RequestMapping(value = "/student/studentInfoUpdateEnd.hd",method=RequestMethod.GET)
	public String studentInfoUpdateEnd(HttpServletRequest req) {
		Student s = null;
		String stuNo=req.getParameter("stuNo");
		String stuEmail=req.getParameter("stuEmail");
		String stuTel=req.getParameter("stuTel");
		String stuAddr=req.getParameter("stuAddr");
		String stuAccount=req.getParameter("stuAccount");
		
		System.out.println(stuNo);

		s.setStuNo(stuNo);
		s.setStuEmail(stuEmail);
		s.setStuTel(stuTel);
		s.setStuAddr(stuAddr);
		s.setStuAccount(stuAccount);
		int result=service.studentInfoUpdate(s);
		return "student/studentInfo";
	}
	
	
}
