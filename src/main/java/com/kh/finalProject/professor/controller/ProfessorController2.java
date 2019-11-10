package com.kh.finalProject.professor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService2;
import com.kh.finalProject.professor.model.vo.InClassStudent;
import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.professor.model.vo.Select_SubjectNameCode;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class ProfessorController2 {
	// 학과생조회

	@Autowired
	ProfessorService2 service;

	@RequestMapping("prof/viewInMajor.hd")
	public String viewInMajor(SelectInMajor sim,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			HttpSession session) {
//		@RequestParam(required = false) ? 왜 
		int numPerPage = 10;
//		List<ProfessorBoard> list = service.boardView(cPage, numPerPage);
//		int totalData = service.selectBoardCount();
		Professor p = (Professor) session.getAttribute("loginMember");
		String deptCode = p.getDeptCode();
		// sim 은 학과생 검색 조건들을 담은 객체. SelectInMajor 화면으로부터 정보를 받아서 객체로 생성.
		// 학과번호로 해당 학과생들을 조회함.
		if (sim != null) {
			sim.setDeptCode(deptCode);
		} else if (sim == null) {
			sim = new SelectInMajor();
			sim.setDeptCode(deptCode);
		}
		System.out.println(sim.getDeptCode());

		// 조건 검색들로 학생 목록을 추출
		List<Student> list = service.selectInMajor(sim, cPage, numPerPage);

		int totalData = service.countInDept(sim);

		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalData);
		model.addAttribute("pageBar",
				PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/prof/viewInMajor.hd"));

		return "professor/stu_view_inMajor";
	}

	// 수강생 조회
	@RequestMapping("prof/viewInClass.hd")
	public String viewInClass(SelectInClass sic, @RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, HttpSession session) {
		int numPerPage = 5;
		Professor p = (Professor) session.getAttribute("loginMember");
		
		
		// 현재 강의중인 과목이 있는 연도 조회====
		List<String> preSubjectYear = service.selectPreSubject(p);
		if (preSubjectYear != null && !preSubjectYear.isEmpty()) {
			model.addAttribute("preSubjectList", preSubjectYear);
		}
		
		
		//=========현재 강의중인 과목 이름 리스트 조회=======
		List<Select_SubjectNameCode> nameCodeList = service.selectPreSubjectNameo(p);
		if(nameCodeList != null && !nameCodeList.isEmpty()) {
			model.addAttribute("nameCodeList", nameCodeList);
		}
		
		//조건 검색에 따른 실 수강생 목록 조회 시작
		if(sic != null && sic.getSubCode() != null && sic.getSubYear() != null) {
		int totalData = service.countInClass(sic);
		
		List<InClassStudent> stuList = service.selectInClass(sic, cPage, numPerPage);
		
		//============강의정보 출력==================
		Map<String,String> params = new HashMap<String,String>();
		params.put("subCode", sic.getSubCode());
		params.put("profId", p.getProfId());
		
		InsertClass ic = service.selectClassInfo(params); 
		//=======================================
		model.addAttribute("stuList",stuList);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/lectureData"));
		}
	return"professor/stu_view_inClass";

	}

	// 출결조회
	@RequestMapping("prof/viewClassAttend.hd")
	public String viewClassAttend(HttpServletRequest req, Model model) {
		System.out.println(req.getParameter("attendDate"));
		System.out.println(req.getParameter("subjectName"));
		System.out.println(req.getParameter("studentName"));
		System.out.println(req.getParameter("grade"));

		return "professor/stu_view_classAttend";
	}

	// 성적 관리
	@RequestMapping("prof/editClassResult.hd")
	public String editClassResult() {

		return "professor/stu_edit_classResult";
	}

	// 강의평가조회
	@RequestMapping("prof/view_evaluation.hd")
	public String viewEvaluation() {

		return "professor/prof_view_classEvaluation";
	}

	// 과제등록
	@RequestMapping("prof/upAssignment.hd")
	public String upAssignment() {

		return "professor/up_assignment";
	}

	// 과제 제출 조회
	@RequestMapping("prof/viewAssignment.hd")
	public String viewAssignment() {

		return "professor/view_assignment";
	}

	// 성적 이의신청 조회
	@RequestMapping("prof/viewObjection.hd")
	public String viewObjection() {

		return "professor/stu_view_objection";
	}

	@RequestMapping("prof/popupBoard")
	public String popupBoard() {

		return "professor/prof_view_subjectBoard";
	}
}
