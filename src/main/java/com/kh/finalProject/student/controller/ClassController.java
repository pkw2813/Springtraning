package com.kh.finalProject.student.controller;

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
import com.kh.finalProject.student.model.vo.Student;



@Controller
public class ClassController {


	@Autowired
	private StudentService1 service;
	
	
	@RequestMapping("/student/applyClass.hd")
	public String selectAllClass(HttpSession session, Model m,HttpServletRequest req,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage)
	{
		Student loginMember=(Student)session.getAttribute("loginMember");
		String stuId=loginMember.getStuNo();
		int numPerPage=10;
		int count=0;
		List<Map> list=service.selectAllClass(stuId);
		
		
		int totalData = service.countAllClass(stuId);
	
		m.addAttribute("list",list);
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/student/applyClass.hd"));
		return "student/applyClass";

	}
	
	
	@RequestMapping(value = "/student/selectClass.hd", method = RequestMethod.POST)
	public String selectClass(HttpSession session, Model m,HttpServletRequest req,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		Student loginMember=(Student)session.getAttribute("loginMember");
		String stuId=loginMember.getStuNo();
		
		
		int numPerPage=10;
		Map<String,Object> param = new HashMap();
		param.put("stuId",stuId);
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
	
			
		  String[] profInfo=req.getParameter("profEvalForm").split(",");
		  String subName=profInfo[0];
		  String profId=profInfo[1];
		  String semester=profInfo[2];
		  String[] sem1 =semester.split("-");
		  int year=Integer.parseInt(sem1[0]);
		  int sem=Integer.parseInt(sem1[1]);
		  if(sem==2) {
			  sem=sem-1;
			  semester=year+"-"+sem;
		  }else if(sem==1) {
			  year=year-1;
			  sem=sem+1;
			  semester=year+"-"+sem;
		  }
		  
		  System.out.println(subName);
		  System.out.println(profId);
		  System.out.println(semester);
		  Map<String,Object> param=new HashMap();
		  param.put("subName", subName);
		  param.put("profId", profId);
		  param.put("semester", semester);
		  Map<String,Object> reprofInfo=service.selectProfInfo(param);
		  double averPoint=service.averPoint(param);
		  
		  List<Map> list=service.selectProfEval(param);
		  m.addAttribute("averPoint",averPoint);
		  m.addAttribute("profInfo",reprofInfo);
		  m.addAttribute("list",list);
		  
	
		  
		  
		return "student/profEval";

	}
	
	@RequestMapping(value = "/student/applyClass.hd", method = RequestMethod.POST)
	
	public String applyClass(HttpServletRequest req,Model m)
	{
		Map param=new HashMap();
		String value=req.getParameter("value");
		String[] value1=value.split(",");
		String stuNo=value1[0];
		String subId=value1[1];
		String profId=value1[2];
		String sem=value1[3];
		
		param.put("stuNo",stuNo);
		param.put("subId",subId);
		param.put("profId",profId);
		param.put("sem",sem);
	
		int result=service.applyClass(param);
		
		
		
		return "student/applyClass";
		
	}
	@RequestMapping(value = "/student/cancelClass.hd", method = RequestMethod.POST)
	public String cancelClass(HttpServletRequest req,Model m)
	{
		Map param=new HashMap();
		String value=req.getParameter("value");
		String[] value1=value.split(",");
		String stuNo=value1[0];
		String subId=value1[1];
		String profId=value1[2];
		String sem=value1[3];
		
		param.put("stuNo",stuNo);
		param.put("subId",subId);
		param.put("profId",profId);
		param.put("sem",sem);
	
		System.out.println(stuNo);
		System.out.println(subId);
		System.out.println(profId);
		System.out.println(sem);
		int result=service.cancelClass(param);
		
		
		
		return "student/applyClass";
	
	}

	@RequestMapping("/student/myClassInfo.hd")
	public String selectMyApplyClass(HttpSession session,Model m) {
	Student loginMember=(Student)session.getAttribute("loginMember");
	String stuId=loginMember.getStuNo();
	
	
	List<Map> list=service.selectMyApplyClass(stuId);

	
	m.addAttribute("list",list);
	
	
	return "student/applyClass";
	
	}
	
}
	

