package com.kh.finalProject.student.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
