package com.kh.finalProject.subject.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.professor.model.vo.Subject;
import com.kh.finalProject.subject.model.dao.SubjectDao;

@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SubjectDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	public List<Map> selectRoom(String roomValue){
		List<Map> list=dao.selectRoom(session, roomValue);
		return list;
	}

	@Override
	public List<Subject> selectTime(Subject s) {
		List<Subject> list=dao.selectTime(session, s);
		return list;
	}
	
	

}












