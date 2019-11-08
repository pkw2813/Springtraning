package com.kh.finalProject.student.model.service;

import java.util.List;

import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.StuTuition;

public interface StudentService3 {
	
	StuTuition selectTuitionOne(StuTuition tuition);
	List<StuTuition> selectTuitionCertList(String studentNo);

}
