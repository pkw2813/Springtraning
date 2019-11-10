package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.student.model.vo.Grade;

public interface StudentService2 {
	
	List<Grade> selectGradeAll(String stuNo);
	
	List<Map> gradeSearchSubType(String stuNo);

}
