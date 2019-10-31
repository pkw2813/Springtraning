package com.kh.finalProject.professor.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.professor.model.vo.Professor;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	
	@Autowired
	private ProfessorService service;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Professor selectOne(String loginId, String loginPwd) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
