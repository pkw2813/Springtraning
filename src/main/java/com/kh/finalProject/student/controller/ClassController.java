package com.kh.finalProject.student.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.student.model.service.StudentService1;



@Controller
public class ClassController {


	@Autowired
	private StudentService1 service;

	@RequestMapping("/student/applyClass.hd")
	public String selectStudent(HttpSession session, Model m) {
		List<InsertClass> list=service.selectAllClass();
		
	
	
		return "student/applyClass";

	}
}

	

