package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.InClassStudent;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.professor.model.vo.Select_ClassInfo;
import com.kh.finalProject.professor.model.vo.Select_SubjectNameCode;
import com.kh.finalProject.student.model.vo.Student;

public interface ProfessorDao2 {

	List<Student> selectInMajor(SqlSessionTemplate session, SelectInMajor sim, int cPage, int numPerPage);
	
	int countInDept(SqlSessionTemplate session, SelectInMajor sim);
	
	List<String> selectPreSubject(SqlSessionTemplate session, Professor p);
	
	List<Select_SubjectNameCode> selectPreSubjectNameo(SqlSessionTemplate session , Professor p);
	
	List<InClassStudent> selectInClass(SqlSessionTemplate session, SelectInClass sic, int cPage, int numPerPage);
	int countInClass(SqlSessionTemplate session, SelectInClass sic);
	
	Select_ClassInfo selectClassInfo(SqlSessionTemplate session, Map<String, String> map);
	
}
