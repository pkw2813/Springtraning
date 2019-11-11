package com.kh.finalProject.subject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.professor.model.vo.Subject;
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
		List<Map> list=service.selectRoom(roomValue);
		try {
			jsonStr=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
			return jsonStr;
	}
	
	 @RequestMapping("/selectTime.hd")
	 @ResponseBody
	 public String selectTime(Subject s) {
		 ObjectMapper mapper=new ObjectMapper();
		 String jsonStr="";
		 List<Subject> list=service.selectTime(s);
		 
		/*
		 * for(Subject s1 :list) { s1.getSubTime(); }
		 */
		 	try {
				jsonStr=mapper.writeValueAsString(list);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		return jsonStr;
	 }
	 
	 
	 
}





















