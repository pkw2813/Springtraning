package com.kh.finalProject.school.model.service;

import java.util.List;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.school.model.vo.College;

public interface SchoolService {
	
	int colCount();
	int deptCount();
	List<College> colList();
	List<Department> deptList();
}
