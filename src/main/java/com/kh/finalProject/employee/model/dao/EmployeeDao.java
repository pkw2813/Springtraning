package com.kh.finalProject.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.student.model.vo.Student;

public interface EmployeeDao {
	
	Employee selectOne(SqlSessionTemplate session, String loginId, String loginPwd);

	List enrollStuList(SqlSessionTemplate session);
	
	BeforeStu selectBeforeStu(SqlSessionTemplate session, int beforeStu);
	
	int deleteBeforeStu(SqlSessionTemplate session, int beforeStu);
	
	int insertNewStu(SqlSessionTemplate session, Student s);
	
	int selectLastNum(SqlSessionTemplate session, String deptCode);
	
	int selectDeptCount(SqlSessionTemplate session, String deptCode);
	
}
