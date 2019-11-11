package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentService1 {
	
	
	List<Map> selectApplyClass(String stuNo);
	Student selectStudent(String studentNo);
	int studentInfoUpdate(Student s);
	List<Map> selectAllClass(String stuId);
	List<Map> selectClass(Map<String,Object>param); 
	int countAllClass(String stuId);
	int countSelectClass(Map<String,Object>param);
	Map selectProfInfo(Map<String,Object>param);
	List<Map> selectProfEval(Map<String,Object>param);
	int applyClass(Map<String,Object>param);
	double averPoint(Map<String,Object>param);
	int cancelClass(Map<String,Object>param);
	List<Map> selectMyApplyClass(String stuId);
}
