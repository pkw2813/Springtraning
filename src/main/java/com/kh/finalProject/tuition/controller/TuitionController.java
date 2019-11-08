package com.kh.finalProject.tuition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TuitionController {
	
	@RequestMapping("/tuition.hd")
	public String tuition() {
		return "admin/tuitionInsert";
	}

}
