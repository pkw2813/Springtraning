package com.kh.finalProject.subject.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.Subject;

@Repository
public class SubjectDaoImpl implements SubjectDao{

	@Override
	public List<Map> selectRoom(SqlSessionTemplate session, String roomValue) {
		return session.selectList("subject.selectRoom", roomValue);
	}

	@Override
	public List<Subject> selectTime(SqlSessionTemplate session, Subject s) {
		return session.selectList("subject.selectTime",s);
	}
	
	

}

























