package com.kh.finalProject.student.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.StuTuition;

public interface StudentDao3 {
	
	StuTuition selectTuitionOne(SqlSessionTemplate session, StuTuition tuition);
	List<StuTuition> selectTuitionCertList(SqlSessionTemplate session, String studentNo);
	StuTuition selectBasicStudentInfo(SqlSessionTemplate session, String studentNo);
	int updateTuitionOne(SqlSessionTemplate session, StuTuition tuition);
}
