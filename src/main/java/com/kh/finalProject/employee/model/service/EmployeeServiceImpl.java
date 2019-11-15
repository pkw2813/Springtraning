package com.kh.finalProject.employee.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.dao.EmployeeDao;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.vo.Professor;
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
	public int insertNewStu(Student s, int beforeStu) throws Exception {
		int result = dao.deleteBeforeStu(session, beforeStu);
		int result1 = dao.insertNewStu(session, s);
		if(result1 == 0 || result1 == 0) {
			new Exception();
		}
		return result1;
	}

	@Override
	public int selectLastNum(String deptCode) {
		return dao.selectLastNum(session, deptCode);
	}

	@Override
	public int selectDeptCount(String deptCode) {
		return dao.selectDeptCount(session, deptCode);
	}

	@Override
	public List<Professor> selectProfList(int cPage, int numPerPage) {
		return dao.selectProfList(session, cPage, numPerPage);
	}

	@Override
	public int profCount() {
		return dao.profCount(session);
	}

	@Override
	public List<Professor> changeProfessor(int cPage, int numPerPage, String deptCode) {
		return dao.changeProfessor(session, cPage, numPerPage, deptCode);
	}

	@Override
	public int changeProfessorCount(String deptCode) {
		return dao.changeProfessorCount(session, deptCode);
	}

	@Override
	public List<Employee> selectEmpList(int cPage, int numPerPage) {
		return dao.selectEmpList(session, cPage, numPerPage);
	}

	@Override
	public int empListCount() {
		return dao.empListCount(session);
	}

	@Override
	public int selectEmpLastNum(String deptCode) {
		return dao.selectEmpLastNum(session, deptCode);
	}

	@Override
	public int insertNewEmp(Employee e) {
		return dao.insertNewEmp(session, e);
	}

	@Override
	public int empLastNumCheck(String deptCode) {
		return dao.empLastNumCheck(session, deptCode);
	}

	@Override
	public int selectProfLastNum(String deptCode) {
		return dao.selectProfLastNum(session, deptCode);
	}

	@Override
	public int insertNewProf(Professor p) {
		return dao.insertNewProf(session, p);
	}

	@Override
	public List<Student> selectStuList(int cPage, int numPerPage) {
		return dao.selectStuList(session, cPage, numPerPage);
	}

	@Override
	public int stuCount() {
		return dao.stuCount(session);
	}
	
	
	
	
	
	
	
	
	
	
	

}
