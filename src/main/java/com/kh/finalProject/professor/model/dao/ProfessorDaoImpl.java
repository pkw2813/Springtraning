package com.kh.finalProject.professor.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.Professor;

@Repository
public class ProfessorDaoImpl implements ProfessorDao {

	@Override
	public Professor selectOne(SqlSessionTemplate session, String loginId, String loginPwd) {
		Professor pro=new Professor();
		pro.setProfId(loginId);
		pro.setProfPw(loginPwd);
		return session.selectOne("professor.selectOne", pro);
	}
	
	

}
