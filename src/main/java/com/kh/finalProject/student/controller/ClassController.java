package com.kh.finalProject.student.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.student.model.service.StudentService1;



@Controller
public class ClassController {


	@Autowired
	private StudentService1 service;
	
	
	@RequestMapping("/student/applyClass.hd")
	public String selectAllClass(HttpSession session, Model m,HttpServletRequest req,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage)
	{
		int numPerPage=10;
		List<Map> list=service.selectAllClass();
		int totalData = service.countAllClass();
		m.addAttribute("list",list);
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/student/applyClass.hd"));
		return "student/applyClass";

	}
	
	
	@RequestMapping(value = "/student/selectClass.hd", method = RequestMethod.POST)
	public String selectClass(HttpSession session, Model m,HttpServletRequest req,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		int numPerPage=10;
		Map<String,Object> param = new HashMap();
		param.put("chk_isu",req.getParameter("chk_isu"));
		param.put("chk_school",req.getParameter("chk_school"));
		param.put("chk_dept",req.getParameter("chk_dept"));
		param.put("chk_year",req.getParameter("chk_year"));
		param.put("chk_sem",req.getParameter("chk_sem"));
		param.put("chk_subName",req.getParameter("chk_subName"));
		List<Map> list=service.selectClass(param);
		int totalData = service.countSelectClass(param);
		
		m.addAttribute("list",list);
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/student/selectClass.hd"));
		return "student/applyClass";
		
	}
	
	@RequestMapping(value = "/student/profEval.hd", method = RequestMethod.POST)
	public String profEval(HttpServletRequest req,Model m)
	{
		System.out.println(req.getParameter("profEvalForm"));
		
		  String[] profInfo=req.getParameter("profEvalForm").split(",");
		  String subName=profInfo[0];
		  String profName=profInfo[2];

		  
		  
		  
		return "student/profEval";

	}
}


	

