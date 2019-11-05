package com.kh.finalProject.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.employee.model.vo.Employee;

public interface EmployeeDao {
	
	Employee selectOne(SqlSessionTemplate session, String loginId, String loginPwd);

	List enrollStuList(SqlSessionTemplate session);
}
