package com.kh.finalProject.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {

	
	@RequestMapping("/schedule.hd")
	public String makeSchedule() {
		
		
		
		return "schedule/schedule";
	}
	
}
