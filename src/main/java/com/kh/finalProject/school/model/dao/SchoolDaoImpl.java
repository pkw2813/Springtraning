package com.kh.finalProject.school.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public List<Map> deptList(SqlSessionTemplate session,int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("school.deptList",null,row);
	}


	
	
	
	

	
	
	
}
















