package com.kh.finalProject.school.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.school.model.dao.SchoolDao;
import com.kh.finalProject.school.model.vo.College;

@Service
public class SchoolServiceImpl implements SchoolService {
	
	@Autowired
	private SchoolDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int colCount() {
		return dao.colCount(session);
	}

	@Override
	public int deptCount() {
		return dao.deptCount(session);
	}

	@Override
	public List<College> colList() {
		return dao.colList(session);
	}

	@Override
	public List<Map> deptList(int cPage, int numPerPage) {
		return dao.deptList(session,cPage,numPerPage);
	}

	
	
	
	
	
	

}




