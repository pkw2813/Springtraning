package com.kh.finalProject.student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.student.model.service.StudentService3;
import com.kh.finalProject.student.model.vo.Tuition;


@Controller
public class StudentController3 {

	@Autowired
	private StudentService3 service;
	
	@RequestMapping("/student/tuitionBill.hd")
	public String selectTuition(Model model) {
		System.out.println("/student/tuitionBill.hd가 호출됨");
		String studentNo="SA0012019001";
		Tuition result=service.selectTuitionOne(studentNo);
		System.out.println(result);
		model.addAttribute("tuition", result);
		
		return "student/studentTuition";
	}
	
}
