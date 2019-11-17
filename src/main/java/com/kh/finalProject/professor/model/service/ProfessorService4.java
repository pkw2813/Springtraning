package com.kh.finalProject.professor.model.service;

import java.util.List;

import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;

public interface ProfessorService4 { // 황준순 전용
	
	List<ProfSubject> selectProfSubject(InfoForProfSubject ifps);
	
	
}
