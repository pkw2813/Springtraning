package com.kh.finalProject.school.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.school.model.vo.College;

@Repository
public class SchoolDaoImpl implements SchoolDao {

	@Override
	public int colCount(SqlSessionTemplate session) {
		return session.selectOne("school.colCount");
	}

	@Override
	public int deptCount(SqlSessionTemplate session) {
		return session.selectOne("school.deptCount");
	}

	@Override
	public List<College> colList(SqlSessionTemplate session) {
		return session.selectList("school.colList");
	}

	@Override
	public List<Department> deptList(SqlSessionTemplate session) {
		return session.selectList("school.deptList");
	}
	
	

	
	
	
}
















