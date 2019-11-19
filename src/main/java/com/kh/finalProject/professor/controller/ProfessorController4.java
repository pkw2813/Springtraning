package com.kh.finalProject.professor.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService2;
import com.kh.finalProject.professor.model.service.ProfessorService4;
import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.professor.model.vo.InfoForProfAssignment;
import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.PlanBoard;
import com.kh.finalProject.professor.model.vo.ProfSubject;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.MySchedule;
import com.kh.finalProject.student.model.vo.MyScheduleForInfo;

@Controller
public class ProfessorController4 { // 황준순 전용
	@Autowired
	ProfessorService4 service;
	
	// 과제등록 게시판 불러오기
	@RequestMapping("prof/assignmentBoard.hd")
	public String viewAssignmentReg(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, HttpSession session, 
			Model model, HttpServletRequest req, String subSeq) {
		System.out.println("prof/assignmentBoard.hd 들어옴.");
		Professor prof=(Professor)session.getAttribute("loginMember");
		
		////////////////////// 이번 학년도 학기 조회
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
		List<ProfSubject> profSubjectList=service.selectProfSubject(ifps); // 이번 학년도 학기 교수의 과목 리스트 받아오기
		System.out.println("profSubjectList:"+profSubjectList);
		
		model.addAttribute("acaYear", acaYear);
		model.addAttribute("acaSemester", acaSemester);
		model.addAttribute("profSubjectList", profSubjectList); // 교수 해당 과목  view에 넘기기
		
		///////////////////////// 과제 게시판 하나 조회
		System.out.println("쿼리스트링으로 받은 subSeq:"+subSeq);
		if(!profSubjectList.isEmpty()) { // 교수의 과목 리스트가 비어 있지 않으면
			if(subSeq==null||subSeq=="") {
				ifps.setSubSeq(profSubjectList.get(0).getSubSeq()); // 과목 일련번호 저장하기
			}else {
				ifps.setSubSeq(subSeq);
			}
		}
		System.out.println("subSeq:"+subSeq);
		System.out.println("ifps.getSubSeq():"+ifps.getSubSeq());
		int numPerPage=5;
		List<AssignmentRegister> arList=service.selectAsgmtBoardList(cPage, numPerPage, ifps);
		int totalData=service.selectAsgmtBoardCount(ifps);
		System.out.println("arList:"+arList);
		model.addAttribute("arList", arList);
		model.addAttribute("totalCount", totalData);
		model.addAttribute("curSubSeq", subSeq);
		model.addAttribute("pageBar", PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/prof/assignmentBoard.hd"));
		///////////////////////// 과제 게시판 하나 조회 끝
		

		return "professor/assignmentBoard";
	}
	
	// 과제 한개 보기
	@RequestMapping("/prof/selectAssignment")
	public ModelAndView selectAssignment(HttpSession session, int subSeq, int asgmtNo) {
		
		ModelAndView mv = new ModelAndView();
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
		InfoForProfAssignment ifpa=new InfoForProfAssignment();
		ifpa.setProfId(profId);
		ifpa.setAcaYear(acaYear);
		ifpa.setAcaSemester(acaSemester);
		ifpa.setSubSeq(subSeq);
		ifpa.setAsgmtNo(asgmtNo);
		AssignmentRegister ar = service.selectAssignment(ifpa);
		// 날짜 시간 초 포맷 변경하기
//		SimpleDateFormat df2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println("오늘날짜, 시간, 초:"+df2.format(date));
//		System.out.println("df2.format(ar.getAsgmtRegdDate()):"+df2.format(ar.getAsgmtRegdDate()));
//		ar.setAsgmtRegdDateStr(df2.format(ar.getAsgmtRegdDate())); // 날짜 시간 초 포맷 변경하기
		System.out.println("ar:"+ar);
		mv.addObject("ar",ar);
		
		mv.setViewName("professor/selectAssignment");
		
		return mv;
	}
	
	// 과제등록 하기 화면으로 이동
	@RequestMapping("prof/assignmentRegister.hd")
	public String upAssignment(HttpSession session, Model model) {
		System.out.println("prof/assignmentRegister.hd 들어옴.");
		Professor prof=(Professor)session.getAttribute("loginMember");
		

		return "professor/assignmentRegister";
	}
}
