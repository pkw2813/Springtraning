package com.kh.finalProject.student.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.student.model.dao.StudentDao1;
import com.kh.finalProject.student.model.vo.Student;

@Service
public class StudentServiceImpl1 implements StudentService1 {
	
	@Autowired
	private StudentDao1 dao;
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public Student selectStudent(String studentNo) {
		
		return dao.selectStudent(session,studentNo);
	}


	@Override
	public int studentInfoUpdate(Student s) {
		
		return dao.studentInfoUpdate(session, s);
	}
	


	
	
}
