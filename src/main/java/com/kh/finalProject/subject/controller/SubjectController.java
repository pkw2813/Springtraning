package com.kh.finalProject.subject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.subject.model.service.SubjectService;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService service;
	
	@RequestMapping("/curriculum.hd")
	public String subject() {
		return "employee/subjectInsert";
	}
	
	@RequestMapping("/selectRoom.hd")
	@ResponseBody
	public String selectRoom(@RequestParam String roomValue) {
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		List<String> list=service.selectRoom(roomValue);
		try {
			jsonStr=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
			return jsonStr;
	}
}





















