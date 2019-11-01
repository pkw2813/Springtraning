package com.kh.finalProject.student.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentDao3 {
	
	Student selectOne(SqlSessionTemplate session,String loginId, String loginPwd);
}
