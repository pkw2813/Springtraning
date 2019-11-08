package com.kh.finalProject.professor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.student.model.vo.Student;

public interface ProfessorDao2 {

	List<Student> selectInMajor(SqlSessionTemplate session, SelectInMajor sim, int cPage, int numPerPage);
	
	int countInDept(SqlSessionTemplate session, SelectInMajor sim);
	
}
