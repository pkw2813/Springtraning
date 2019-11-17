package com.kh.finalProject.professor.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.professor.model.service.ProfessorService2;
import com.kh.finalProject.professor.model.service.ProfessorService4;
import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.MySchedule;
import com.kh.finalProject.student.model.vo.MyScheduleForInfo;

@Controller
public class ProfessorController4 { // 황준순 전용
	@Autowired
	ProfessorService4 service;
	
	// 과제등록 페이지 불러오기
	@RequestMapping("prof/viewAssignmentReg.hd")
	public String viewAssignmentReg(HttpSession session, Model model) {
		System.out.println("prof/viewAssignmentReg.hd 들어옴.");
		Professor prof=(Professor)session.getAttribute("loginMember");
		
		//////////////////////
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String acaYear=today.substring(0, 4);
		String acaSemester="";
		if(todayMonth>=1&&todayMonth<=6) {
			acaSemester="1";
		}else if(todayMonth>=7&&todayMonth<=12) {
			acaSemester="2";
		}
		String profId=prof.getProfId();
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		InfoForProfSubject ifps=new InfoForProfSubject();
		ifps.setProfId(profId);
		ifps.setAcaYear(acaYear);
		ifps.setAcaSemester(acaSemester);
		
		System.out.println("ifps:"+ifps);
		List<ProfSubject> profSubjectList=service.selectProfSubject(ifps);
		System.out.println("profSubjectList:"+profSubjectList);
		
		model.addAttribute("acaYear", acaYear);
		model.addAttribute("acaSemester", acaSemester);
		model.addAttribute("profSubjectList", profSubjectList); // 교수 해당 과목 넘기기

		return "professor/up_assignment";
	}
	
	// 과제등록 페이지 불러오기
		@RequestMapping("prof/registerAssignment.hd")
		public String upAssignment(HttpSession session, Model model) {
			System.out.println("prof/registerAssignment.hd 들어옴.");
			Professor prof=(Professor)session.getAttribute("loginMember");
			
			//////////////////////
			Date date=new Date();
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			System.out.println("오늘날짜:"+df.format(date));
			String today=df.format(date);
			
			System.out.println("금년도:"+today.substring(0, 4));
			int todayMonth=Integer.parseInt(today.substring(5, 7));
			System.out.println("금월:"+todayMonth);
			String acaYear=today.substring(0, 4);
			String acaSemester="";
			if(todayMonth>=1&&todayMonth<=6) {
				acaSemester="1";
			}else if(todayMonth>=7&&todayMonth<=12) {
				acaSemester="2";
			}
			String profId=prof.getProfId();
			System.out.println("acaYear:"+acaYear);
			System.out.println("acaSemester:"+acaSemester);
			/////////////////////
			InfoForProfSubject ifps=new InfoForProfSubject();
			ifps.setProfId(profId);
			ifps.setAcaYear(acaYear);
			ifps.setAcaSemester(acaSemester);
			
			System.out.println("ifps:"+ifps);
			List<ProfSubject> profSubjectList=service.selectProfSubject(ifps);
			System.out.println("profSubjectList:"+profSubjectList);
			
			model.addAttribute("acaYear", acaYear);
			model.addAttribute("acaSemester", acaSemester);
			model.addAttribute("profSubjectList", profSubjectList); // 교수 해당 과목 넘기기

			return "professor/up_assignment";
		}
}
