package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentDao1 {
	
	Student selectStudent(SqlSessionTemplate session,String studentNo);
	int studentInfoUpdate(SqlSessionTemplate session,Student s);
	List<Map> selectAllClass(SqlSessionTemplate session,String stuId);
	List<Map> selectClass(SqlSessionTemplate session,Map<String,Object> param);
	int countAllClass(SqlSessionTemplate session,String stuId);
	int countSelectClass(SqlSessionTemplate session,Map<String,Object>param);
	List<Map> selectProfEval(SqlSessionTemplate session,Map<String,Object>param);
	Map selectProfInfo(SqlSessionTemplate session,Map<String,Object> param);
	int applyClass(SqlSessionTemplate session,Map<String,Object> param);
	List<Map> selectApplyClass(SqlSessionTemplate session,String stuNo);
	double averPoint(SqlSessionTemplate session,Map<String,Object>param);
	int cancelClass(SqlSessionTemplate session,Map<String,Object> param);
	List<Map> selectMyApplyClass(SqlSessionTemplate session,String stuId);
	
}
