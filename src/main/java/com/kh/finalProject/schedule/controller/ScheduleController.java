package com.kh.finalProject.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.schedule.model.service.ScheduleService;
import com.kh.finalProject.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	ScheduleService service;
	
	@RequestMapping("/schedule.hd")
	public String makeSchedule() {
		return "schedule/schedule";
	}
	
	@RequestMapping("/getCalendar.hd")
	@ResponseBody
	public HashMap<String, Object> getCalendar(String start, String end) {
		HashMap resultMap = new HashMap();		
		HashMap map = new HashMap();
		resultMap.put("start", start);
		resultMap.put("end", end);
		List<Schedule> list = service.getCalendar(resultMap);
		map.put("list", list);
		return map;
	}
	
	
	@RequestMapping("/insertPlan.hd")
		public String insertPlan(String start, String end, String title) {
		HashMap map = new HashMap();
		System.out.println(start);
		System.out.println(end);
		System.out.println(title);
		int result;
		map.put("start", start);
		map.put("end", end);
		map.put("title", title);
		try {
			result = service.insertPlan(map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "schedule/schedule";
	}
	
	
	
}
