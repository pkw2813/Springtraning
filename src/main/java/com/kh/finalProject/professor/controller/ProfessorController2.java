package com.kh.finalProject.professor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfessorController2 {
	//학과생조회
	@RequestMapping("prof/viewInMajor.hd")
	public String viewInMajor(){
		
		
		return "professor/stu_view_inMajor";
	}
	//수강생 조회
	@RequestMapping("prof/viewInClass.hd")
	public String viewInClass() {
		
		return "professor/stu_view_inClass";
	}
	
	//출결조회
	@RequestMapping("prof/viewClassAttend.hd")
	public String viewClassAttend(HttpServletRequest req , Model model) {
		System.out.println(req.getParameter("attendDate"));
		System.out.println(req.getParameter("subjectName"));
		System.out.println(req.getParameter("studentName"));
		System.out.println(req.getParameter("grade"));
		
		return "professor/stu_view_classAttend";
	}
	//성적 관리
	@RequestMapping("prof/editClassResult.hd")
	public String editClassResult() {
		
		return "professor/stu_edit_classResult";
	}
	
	//과제등록
	@RequestMapping("prof/upAssignment.hd")
	public String upAssignment() {
		
		
		return "professor/up_assignment";
	}
	
	
}
