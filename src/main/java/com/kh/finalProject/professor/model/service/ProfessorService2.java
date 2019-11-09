package com.kh.finalProject.professor.model.service;

import java.util.List;

import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.student.model.vo.Student;

public interface ProfessorService2 {
	
	Professor selectOne(String loginId,String loginPwd);
	//학과생 조회=====
	List<Student> selectInMajor(SelectInMajor sim, int cPage, int numPerPage);
	int countInDept(SelectInMajor sim);
	//==============
	
	//개설된 강의들의 연도 중복제거하여 조회
	List<String> selectPreSubject(Professor p);
	
	//개설된 강의들의 이름 중복  제거하여 조회
	List <String> selectPreSubjectNameo(Professor p);
	
	//수강생을 조건(sic)에 따라 조회 ============
	List <Student> selectInClass(SelectInClass sic, int cPage, int numPerPage);
	int countInClass(SelectInClass sic);
}
