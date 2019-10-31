package com.kh.finalProject.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.employee.model.dao.EmployeeDao;
import com.kh.finalProject.employee.model.vo.Employee;

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
	
	

}
