package com.kh.finalProject.student.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.student.model.service.StudentService3;
import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.Tuition;


@Controller
public class StudentController3 {

	@Autowired
	private StudentService3 service;
	
	@RequestMapping("/student/tuitionBill.hd")
	public String selectTuition(HttpSession session, Model model) {
		System.out.println("/student/tuitionBill.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo="SA0012019001";
		studentNo=stu.getStuNo();
		System.out.println("로그인한 아이디:"+studentNo);
		Tuition result=service.selectTuitionOne(studentNo);
		System.out.println(result);
		model.addAttribute("tuition", result);
		
		return "student/studentTuition";
	}
	
}
