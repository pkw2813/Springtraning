package com.kh.finalProject.student.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Grade;

public interface StudentDao2 {
	
	List<Grade> selectGradeList(SqlSessionTemplate session, String stuNo);
}
