package com.kh.finalProject.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.school.model.service.SchoolService;
import com.kh.finalProject.school.model.vo.College;

@Controller
public class SchoolController {
	
	
	@Autowired 
	private SchoolService service;
	 
	
	@RequestMapping("/school.hd")
	public String school(Model model) {
		int colCount=service.colCount();
		int deptCount=service.deptCount();
		List<College> colList=service.colList();
		List<Department> deptList=service.deptList();
		
		model.addAttribute("colCount",colCount);
		model.addAttribute("deptCount",deptCount);
		
		return"employee/school";
	}
	
}

































