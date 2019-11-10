package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Grade;

@Repository
public class StudentDaoImpl2 implements StudentDao2 {

	@Override
	public List<Grade> selectGradeList(SqlSessionTemplate session, String stuNo) {
		return session.selectList("student2.selectGradeList",stuNo);
	}

	@Override
	public List<Map> gradeSearchSubType(SqlSessionTemplate session, String stuNo) {
		return session.selectList("student2.selectGradeListSubType",stuNo);
	}
	
	

	
	
	

}
