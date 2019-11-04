package com.kh.finalProject.beforeStudent.model.service;

import java.util.List;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

public interface BeforeStuService {

	public List selectColList();
	
	public List selectDeptList(String result);
	
	public int insertBeforeStudent(BeforeStu s);
}
