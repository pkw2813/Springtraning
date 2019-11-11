package com.kh.finalProject.student.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		String stuNo="S2018A01001";
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
		model.addAttribute("list", list);
		
		List<Map> list1 = service.gradeSearchSubType(stuNo);
//		List<Map<String,Map>> result=new ArrayList();
		model.addAttribute("list1",list1);
		return "student/gradeSearchAll";	
	}
	
	
	
	//페이지 전환용
	@RequestMapping("/student/gradeSearchNow.hd")
	public String gradeSerachNow() {
		return "student/gradeSearchNow";
	}
	
	
	
}
