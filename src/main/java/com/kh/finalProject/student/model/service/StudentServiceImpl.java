package com.kh.finalProject.student.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.student.model.dao.StudentDao;
import com.kh.finalProject.student.model.vo.Student;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDao dao;
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public Student selectOne(String loginId, String loginPwd) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
