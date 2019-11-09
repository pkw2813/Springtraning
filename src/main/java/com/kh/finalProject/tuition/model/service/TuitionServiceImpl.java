package com.kh.finalProject.tuition.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.tuition.model.dao.TuitionDao;
import com.kh.finalProject.tuition.model.vo.Tuition;

@Service
public class TuitionServiceImpl implements TuitionService {
	
	@Autowired
	private TuitionDao Dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Tuition selectOne(String tuiYear, String deptCode) {
		Tuition tui=Dao.selectOne(session, tuiYear, deptCode);
		return tui;
	}

	@Override
	public int insertTuition(Tuition t) {
		int result=Dao.insertTuition(session,t);
		System.out.println(t+"!@3123");
		return result;
	}
	
	
}
