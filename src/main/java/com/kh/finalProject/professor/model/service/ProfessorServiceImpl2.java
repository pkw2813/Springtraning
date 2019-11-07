package com.kh.finalProject.professor.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.professor.model.dao.ProfessorDao2;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.student.model.vo.Student;

@Service
public class ProfessorServiceImpl2 implements ProfessorService2{
	@Autowired
	ProfessorDao2 dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public Professor selectOne(String loginId, String loginPwd) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Student> selectInMajor(SelectInMajor sim, int cPage, int numPerPage) {
		List<Student> list = dao.selectInMajor(session, sim, cPage, numPerPage);
		
		return list;
	}



	@Override
	public int countInDept(String deptCode) {
		int result = dao.countInDept(session, deptCode);
		return result;
	}
	
	

}
