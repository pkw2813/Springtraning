package com.kh.finalProject.beforeStudent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.beforeStudent.model.service.BeforeStuService;

@Controller
public class BeforeStuController {

	@Autowired
	private BeforeStuService service;
	
	
	
	@RequestMapping("/beforeStudent/enroll.hd")
	public String enrollStudent() {
		
		
		
		
		return "";
	}
	
	
	
}
