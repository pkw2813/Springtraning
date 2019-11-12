package com.kh.finalProject.schedule.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		public String insertPlan(String start, String end, String title, Model model) {
		System.out.println(start);
		System.out.println(end);
		System.out.println(title);
		String msg ="";
		String loc = "/schedule.hd";
		try {
			HashMap map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("title", title);
			service.insertPlan(map);
			msg = "일정 등록 완료";
		}catch(Exception e){
			msg = "일정 등록 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
		
	}
	
	
	
}
