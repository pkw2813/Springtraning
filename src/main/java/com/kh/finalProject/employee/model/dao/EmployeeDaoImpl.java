package com.kh.finalProject.employee.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.Student;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public Employee selectOne(SqlSessionTemplate session, String loginId, String loginPwd) {
		Employee emp=new Employee();
		emp.setEmpId(loginId);
		emp.setEmpPw(loginPwd);
		return session.selectOne("employee.selectOne",emp);
	}

	@Override
	public List enrollStuList(SqlSessionTemplate session) {
		return session.selectList("beforeStu.selectList");
	}

	@Override
	public BeforeStu selectBeforeStu(SqlSessionTemplate session, int beforeStu) {
		return session.selectOne("beforeStu.selectBeforeStu", beforeStu);
	}

	@Override
	public int deleteBeforeStu(SqlSessionTemplate session, int beforeStu) {
		return session.delete("beforeStu.deleteBeforeStu", beforeStu);
	}

	@Override
	public int insertNewStu(SqlSessionTemplate session, Student s) {
		return session.insert("student.insertNewStu", s);
	}

	@Override
	public int selectLastNum(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("student.selectLastNum", deptCode);
	}

	@Override
	public int selectDeptCount(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("student.selectDeptCount", deptCode);
	}

	@Override
	public List<Professor> selectProfList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor.selectProfList",null, row);
	}

	@Override
	public int profCount(SqlSessionTemplate session) {
		return session.selectOne("professor.profCount");
	}

	@Override
	public List<Professor> changeProfessor(SqlSessionTemplate session, int cPage, int numPerPage, String deptCode) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor.changeProfessor", deptCode, row);
	}

	@Override
	public int changeProfessorCount(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("professor.changeProfessorCount", deptCode);
	}

	@Override
	public List<Employee> selectEmpList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("employee.selectEmpList", null, row);
	}

	@Override
	public int empListCount(SqlSessionTemplate session) {
		return session.selectOne("employee.empListCount");
	}

	@Override
	public int selectEmpLastNum(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("employee.selectEmpLastNum", deptCode);
	}

	@Override
	public int insertNewEmp(SqlSessionTemplate session, Employee e) {
		return session.insert("employee.insertNewEmp", e);
	}
	
	
	
	
	

	

}
