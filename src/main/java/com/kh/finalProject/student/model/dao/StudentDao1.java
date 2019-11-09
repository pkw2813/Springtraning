package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentDao1 {
	
	Student selectStudent(SqlSessionTemplate session,String studentNo);
	int studentInfoUpdate(SqlSessionTemplate session,Student s);
	List<Map> selectAllClass(SqlSessionTemplate session);
	List<Map> selectClass(SqlSessionTemplate session,Map<String,Object> param);
	int countAllClass(SqlSessionTemplate session);
	int countSelectClass(SqlSessionTemplate session,Map<String,Object>param);
}
