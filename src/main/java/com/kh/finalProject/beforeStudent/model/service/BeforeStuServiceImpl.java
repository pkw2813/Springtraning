package com.kh.finalProject.beforeStudent.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.beforeStudent.model.dao.BeforeStuDao;

@Service
public class BeforeStuServiceImpl implements BeforeStuService{

	@Autowired
	private BeforeStuDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List selectColList() {
		return dao.selectColList(session);
	}

	@Override
	public List selectDeptList(String result) {
		return dao.selectDeptList(session, result);
	}
	
	
	
	
	
	
	
}
