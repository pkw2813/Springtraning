package com.kh.finalProject.student.model.service;

import java.util.List;

import com.kh.finalProject.student.model.vo.Grade;

public interface StudentService2 {
	
	List<Grade> selectGradeAll(String stuNo);

}
