package com.kh.finalProject.school.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.school.model.vo.College;

public interface SchoolDao {
	
	int colCount(SqlSessionTemplate session);
	int deptCount(SqlSessionTemplate session);
	List<College> colList(SqlSessionTemplate session);
	List<Department> deptList(SqlSessionTemplate session);

}
