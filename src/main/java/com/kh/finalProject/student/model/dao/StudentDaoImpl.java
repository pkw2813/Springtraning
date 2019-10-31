package com.kh.finalProject.student.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Student;

@Repository
public class StudentDaoImpl implements StudentDao {

	@Override
	public Student selectOne(SqlSessionTemplate session, String loginId, String loginPwd) {
		Student s=null;
		s.setStuNo(loginId);
		s.setStuPw(loginPwd);
		
		return session.selectOne("student.selectOne", s);
	}
	
	

}
