package com.kh.finalProject.beforeStudent.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BeforeStuDaoImpl implements BeforeStuDao{

	@Override
	public List selectColList(SqlSessionTemplate session) {
		return session.selectList("beforeStu.selectColList");
	}

	@Override
	public List selectDeptList(SqlSessionTemplate session, String result) {
		return session.selectList("beforeStu.selectDeptList", result);
	}

	
	
	
	
	
	
}
