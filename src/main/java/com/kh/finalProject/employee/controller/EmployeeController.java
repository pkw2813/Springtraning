package com.kh.finalProject.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.employee.model.service.EmployeeService;

@Controller
public class EmployeeController {

	
	@Autowired
	private EmployeeService service;

	@RequestMapping("/enrollStudent.hd")
	public ModelAndView enrollStudent() {
		ModelAndView mv = new ModelAndView();
		
		List list = service.enrollStuList();
		System.out.println(list);
		mv.setViewName("admin/enrollStudent");
		mv.addObject("list", list);
		return mv;
		}
	
}
