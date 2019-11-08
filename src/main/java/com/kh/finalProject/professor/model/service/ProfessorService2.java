package com.kh.finalProject.professor.model.service;

import java.util.List;

import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.student.model.vo.Student;

public interface ProfessorService2 {
	
	Professor selectOne(String loginId,String loginPwd);
	List<Student> selectInMajor(SelectInMajor sim, int cPage, int numPerPage);
	int countInDept(SelectInMajor sim);
}
