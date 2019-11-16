package com.kh.finalProject.school.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.school.model.service.SchoolService;
import com.kh.finalProject.school.model.vo.College;

@Controller
public class SchoolController {
	
	
	@Autowired 
	private SchoolService service;
	 
	
	@RequestMapping("/school.hd")
	public String school(Model model, @RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		int numPerPage=4;

		int colCount=service.colCount();
		List<College> colList=service.colList();
		List<Map> deptList=service.deptList(cPage,numPerPage);
		int totalData=service.deptCount();
		
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData,cPage,numPerPage,"/finalProject/school.hd"));
		
		model.addAttribute("colCount",colCount);
		model.addAttribute("deptCount",totalData);
		model.addAttribute("colList",colList);
		model.addAttribute("deptList",deptList);
		return"employee/school";
	}
	
}

































