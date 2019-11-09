package com.kh.finalProject.student.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.student.model.dao.StudentDao3;
import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.StuTuition;

@Service
public class StudentServiceImpl3 implements StudentService3 {
	
	@Autowired
	private StudentDao3 dao;
	@Autowired
	private SqlSessionTemplate session;
	


	@Override
	public StuTuition selectTuitionOne(StuTuition tuition) {
		System.out.println("selectTuitionOne: service 들어옴."+tuition);
		return dao.selectTuitionOne(session, tuition);
	}


	@Override
	public List<StuTuition> selectTuitionCertList(String studentNo) {
		return dao.selectTuitionCertList(session, studentNo);
	}


	@Override
	public StuTuition selectBasicStudentInfo(String studentNo) {
		return dao.selectBasicStudentInfo(session, studentNo);
	}

	
	
}
