package com.kh.finalProject.employee.model.service;

import java.util.List;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.Student;

public interface EmployeeService {
	
	Employee selectOne(String loginId,String loginPwd);

	List enrollStuList();
	
	BeforeStu selectBeforeStu(int beforeStu);
	
	int insertNewStu(Student s, int beforeStu) throws Exception;
	
	int selectLastNum(String deptCode);

	int selectDeptCount(String deptCode);
	
	List<Professor> selectProfList(int cPage, int numPerPage);
	
	int profCount();
	
	List<Professor> changeProfessor(int cPage, int numPerPage, String deptCode);
	
	int changeProfessorCount(String deptCode);
	
	List<Employee> selectEmpList(int cPage, int numPerPage);
	
	int empListCount();
	}
