package com.kh.finalProject.student.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.student.model.dao.StudentDao2;
import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.Student;

@Service
public class StudentServiceImpl2 implements StudentService2 {
	
	@Autowired
	private StudentDao2 dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Grade> selectGradeAll(String stuNo) {
		return dao.selectGradeList(session, stuNo);
	}
	

	

	
	
}
