package com.kh.finalProject.beforeStudent.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.beforeStudent.model.service.BeforeStuService;
import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

@Controller
public class BeforeStuController {

	@Autowired
	private BeforeStuService service;
	
	
	
	@RequestMapping("/selectColList.do")
	@ResponseBody
	public Map selectColList() {
		
		Map map = new HashedMap();
		List list = service.selectColList();
		map.put("list", list);
		return map;
	}
	
	
	@RequestMapping("/selectDeptList.do")
	@ResponseBody
	public Map selectDeptList(@RequestParam String result) {
		System.out.println("넘어옴");
		
		Map map = new HashedMap();
		List list = service.selectDeptList(result);
		System.out.println(list);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping("/beforeStudent/enroll.hd")
	@ResponseBody
	public String insertBeforeStudent(BeforeStu s, HttpServletRequest req) {
		int result = service.insertBeforeStudent(s);
		String msg = result>0?"입학 신청 완료!":"입학 신청 실패";
		String loc = "/";
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		return "common/msg";
	}
	
}
