package com.kh.finalProject.beforeStudent.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.beforeStudent.model.service.BeforeStuService;

@Controller
public class BeforeStuController {

	@Autowired
	private BeforeStuService service;
	
	
	
	@RequestMapping("/selectColList.do")
	public Map enrollStudent() {
		Map map = new HashedMap();
		List list = service.selectColList();
		System.out.println("넘어옴");
		System.out.println(list);
		map.put("list", list);
		
		return map;
	}
	
	
	
}
