package com.kh.finalProject.student.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.student.model.dao.StudentDao3;
import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.Tuition;

@Service
public class StudentServiceImpl3 implements StudentService3 {
	
	@Autowired
	private StudentDao3 dao;
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public Student selectOne(String loginId, String loginPwd) {
		System.out.println(loginId+"@@"+loginPwd);
		Student stu=dao.selectOne(session, loginId, loginPwd);
		return stu;
	}


	@Override
	public Tuition selectTuitionOne(String studentNo) {
		System.out.println("service 들어옴."+studentNo);
		return dao.selectTuitionOne(session, studentNo);
	}

	
	
}
