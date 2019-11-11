package com.kh.finalProject.subject.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectDaoImpl implements SubjectDao{

	@Override
	public List<String> selectRoom(SqlSessionTemplate session, String roomValue) {
		return session.selectList("subejct.selectRoom", roomValue);
	}
	
	

}
