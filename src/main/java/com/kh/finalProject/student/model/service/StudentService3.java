package com.kh.finalProject.student.model.service;

import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.Tuition;

public interface StudentService3 {
	
	Student selectOne(String loginId,String loginPwd);
	Tuition selectTuitionOne(String studentNo);

}
