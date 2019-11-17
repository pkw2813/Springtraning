package com.kh.finalProject.professor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;

public interface ProfessorDao4 {

	List<ProfSubject> selectProfSubject(SqlSessionTemplate session, InfoForProfSubject ifps);
	
}
