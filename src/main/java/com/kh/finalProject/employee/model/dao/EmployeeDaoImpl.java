package com.kh.finalProject.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.employee.model.vo.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public Employee selectOne(SqlSessionTemplate session, String loginId, String loginPwd) {
		Employee emp=new Employee();
		emp.setEmpId(loginId);
		emp.setEmpPw(loginPwd);
		return session.selectOne("employee.selectOne",emp);
	}
	
	

}
