package com.kh.finalProject.employee.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.dao.EmployeeDao;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.student.model.vo.Student;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Employee selectOne(String loginId, String loginPwd) {
		Employee emp=dao.selectOne(session,loginId,loginPwd);
		return emp;
	}

	@Override
	public List enrollStuList() {
		return dao.enrollStuList(session);
	}

	@Override
	public BeforeStu selectBeforeStu(int beforeStu) {
		return dao.selectBeforeStu(session, beforeStu);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteBeforeStu(int beforeStu) throws Exception {
		int result = dao.deleteBeforeStu(session, beforeStu);
		if(result == 0) {
			new Exception();
		}
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertNewStu(Student s) throws Exception {
		int result = dao.insertNewStu(session, s);
		System.out.println("insert new :" + result);
		if(result == 0) {
			new Exception();
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	

}
