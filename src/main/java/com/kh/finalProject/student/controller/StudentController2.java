package com.kh.finalProject.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.student.model.service.StudentService2;
import com.kh.finalProject.student.model.vo.Grade;


@Controller
public class StudentController2 {

	@Autowired
	private StudentService2 service;
	
	//페이지 전환용
	@RequestMapping("/student/gradeSearchAll.hd")
	public String gradeSearchAll(Model model) {
		String stuNo="SA0012019001";
		List<Grade> list = service.selectGradeAll(stuNo);
		model.addAttribute("list", list);
		return "student/gradeSearchAll";
	}
	
	//페이지 전환용
	@RequestMapping("/student/gradeSearchNow.hd")
	public String gradeSerachNow() {
		return "student/gradeSearchNow";
	}
	
	
	
}
