package com.kh.finalProject.subject.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.subject.model.dao.SubjectDao;

@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SubjectDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	public List<String> selectRoom(String roomValue){
		List<String> list=dao.selectRoom(session, roomValue);
		return list;
	}

}
