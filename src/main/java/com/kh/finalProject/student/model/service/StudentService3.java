package com.kh.finalProject.student.model.service;

import java.util.List;

import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.GraduationCon;
import com.kh.finalProject.student.model.vo.StuTuition;

public interface StudentService3 {
	
	StuTuition selectTuitionOne(StuTuition tuition);
	List<StuTuition> selectTuitionCertList(String studentNo);
	StuTuition selectBasicStudentInfo(String studentNo);
	int updateTuitionOne(StuTuition tuition, Student student) throws Exception;
	GraduationCon selectGraduationCon(String studentNo);
	String selectStuYearSem(String studentNo);

}
