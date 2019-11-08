package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentService1 {
	
	Student selectStudent(String studentNo);
	int studentInfoUpdate(Student s);
	List<Map> selectAllClass();

}
