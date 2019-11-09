package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Student;

@Repository
public class StudentDaoImpl1 implements StudentDao1 {

	@Override
	public Student selectStudent(SqlSessionTemplate session, String studentNo) {
	
		return session.selectOne("student1.selectStudent",studentNo);
	}

	@Override
	public int studentInfoUpdate(SqlSessionTemplate session, Student s) {
		// TODO Auto-generated method stub
		return session.update("student1.studentInfoUpdate",s);
	}

	@Override
	public List<Map> selectAllClass(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("student1.selectAllClass");
	}

	@Override
	public List<Map> selectClass(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("student1.selectClass",param);
	}

	@Override
	public int countAllClass(SqlSessionTemplate session) {
		
		return session.selectOne("student1.countAllClass");
	}

	@Override
	public int countSelectClass(SqlSessionTemplate session,Map<String, Object> param) {
		
		return session.selectOne("student1.countSelectClass");
	}
	
	


	
	
	
	

}
