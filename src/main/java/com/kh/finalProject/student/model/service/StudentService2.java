package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.InfoForSearchGrade;
import com.kh.finalProject.student.model.vo.Request;

public interface StudentService2 {
	
	List<Grade> selectGradeAll(String stuNo);
	
	List<Map> gradeSearchSubType(String stuNo);
	
	int insertAppeal(Request request);
	
	/* List<Request> selectRequest(); */
	
	
	List<Grade> selectGradeNow(InfoForSearchGrade ifsg);
	
	List<Grade> selectsubType(String stuNo);

}
