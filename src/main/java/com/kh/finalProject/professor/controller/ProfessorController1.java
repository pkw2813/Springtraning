package com.kh.finalProject.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfessorController1 {
	//강의조회
	@RequestMapping("/professor/subjectView")
	public String subjectView() {
		
		
		
		return "professor/subjectView";
	}
	//교수정보
	@RequestMapping("/professor/professorView")
	public String professorView() {
		
		return "professor/professorView";
	}
	//교수수정
	@RequestMapping("/professor/updateProf")
	public String updateProfessor() {
		
		return "professor/updateProf";
	}
}
