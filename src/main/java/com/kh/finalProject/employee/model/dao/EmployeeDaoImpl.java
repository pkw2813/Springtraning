package com.kh.finalProject.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.vo.Employee;
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
//		return session.selectOne("beforeStu.selectBeforeStu", beforeStu);
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
		System.out.println("test");
		return session.selectOne("student.selectLastNum", deptCode);
	}
	
	
	
	
	

	

}
