package com.kh.finalProject.school.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.school.model.vo.College;

public interface SchoolService {
	
	int colCount();
	int deptCount();
	List<College> colList();
	List<Map> deptList(int cPage, int numPerPage);
}
