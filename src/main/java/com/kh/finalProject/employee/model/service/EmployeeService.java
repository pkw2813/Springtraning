package com.kh.finalProject.employee.model.service;

import com.kh.finalProject.employee.model.vo.Employee;

public interface EmployeeService {
	
	Employee selectOne(String loginId,String loginPwd);

}
