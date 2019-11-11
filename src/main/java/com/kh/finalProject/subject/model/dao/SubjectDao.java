package com.kh.finalProject.subject.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface SubjectDao {
	
	List<String> selectRoom(SqlSessionTemplate session, String roomValue);

}
