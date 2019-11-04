package com.kh.finalProject.beforeStudent.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface BeforeStuDao {

	public List selectColList(SqlSessionTemplate session);
	
	public List selectDeptList(SqlSessionTemplate session, String result);
	
	
}
