package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

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

		return dao.selectStudent(session, studentNo);
	}

	@Override
	public int studentInfoUpdate(Student s) {

		return dao.studentInfoUpdate(session, s);
	}

	@Override
	public List<Map> selectAllClass(String stuId,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAllClass(session,stuId,cPage,numPerPage);
	}

	@Override
	public List<Map> selectClass(Map<String, Object> param,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectClass(session,param,cPage,numPerPage);
	}

	@Override
	public int countAllClass(String stuId) {
		
		return dao.countAllClass(session,stuId);
	}

	@Override
	public int countSelectClass(Map<String, Object> param) {
		
		return dao.countSelectClass(session,param);
	}

	@Override
	public List<Map> selectProfEval(Map<String, Object> param) {
		
		return dao.selectProfEval(session,param);
	}

	@Override
	public Map selectProfInfo(Map<String, Object> param) {
		
		return dao.selectProfInfo(session,param);
	}

	@Override
	public int applyClass(Map<String, Object> param) {
	
		return dao.applyClass(session,param);
	}

	@Override
	public List<Map> selectApplyClass(String stuNo) {
		
		return dao.selectApplyClass(session,stuNo);
	}

	@Override
	public double averPoint(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.averPoint(session,param);
	}

	@Override
	public int cancelClass(Map<String, Object> param) {
		
		return dao.cancelClass(session,param);
	}

	@Override
	public List<Map> selectMyApplyClass(String stuId) {
		
		return dao.selectMyApplyClass(session,stuId);
	}

	@Override
	public List<Map> myApplyClass(String stuId,int cPage,int numPerPage) {
	
		return dao.myApplyClass(session,stuId,cPage,numPerPage);
		
	}

	@Override
	public int countMyApplyClass(String stuId) {
		// TODO Auto-generated method stub
		return dao.countMyApplyClass(session,stuId);
	}
	
	@Override
	public int cancelMyClass(Map<String, Object> param) {
		
		return dao.cancelMyClass(session,param);
	}
	
	@Override
	public List<Map> selectMyClass(Map<String, Object> param,int cPage,int numPerPage) {
		
		return dao.selectMyClass(session,param,cPage,numPerPage);
	}
	
	 
	@Override
	public int countSelectMyClass(Map<String, Object> param) {
		
		return dao.countSelectMyClass(session,param);
	}
	
	

}
