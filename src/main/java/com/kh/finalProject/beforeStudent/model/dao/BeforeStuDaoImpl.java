package com.kh.finalProject.beforeStudent.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

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

	@Override
	public int insertBeforeStudent(SqlSessionTemplate session, BeforeStu s) {
		return session.insert("beforeStu.insertBeforeStudent", s);
	}

	
	
	
	
	
	
	
}
