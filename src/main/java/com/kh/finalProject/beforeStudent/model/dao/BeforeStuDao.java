package com.kh.finalProject.beforeStudent.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

public interface BeforeStuDao {

	public List selectColList(SqlSessionTemplate session);
	
	public List selectDeptList(SqlSessionTemplate session, String result);
	
	public int insertBeforeStudent(SqlSessionTemplate session, BeforeStu s);
}
