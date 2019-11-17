package com.kh.finalProject.professor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;


@Repository
public class ProfessorDaoImpl4 implements ProfessorDao4 {

	@Override
	public List<ProfSubject> selectProfSubject(SqlSessionTemplate session, InfoForProfSubject ifps) {
		return session.selectList("prof4.selectProfSubject", ifps);
	}

	
	
	
	
	
	
}
