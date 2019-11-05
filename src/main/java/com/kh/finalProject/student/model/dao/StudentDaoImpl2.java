package com.kh.finalProject.student.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.Student;

@Repository
public class StudentDaoImpl2 implements StudentDao2 {

	@Override
	public List<Grade> selectGradeList(SqlSessionTemplate session, String stuNo) {
		return session.selectList("student2.selectGradeList");
	}

	
	
	

}
