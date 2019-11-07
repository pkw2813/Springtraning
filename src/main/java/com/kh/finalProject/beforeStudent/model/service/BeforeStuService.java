package com.kh.finalProject.beforeStudent.model.service;

import java.util.List;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

public interface BeforeStuService {

	public List<String> selectColList();
	
	public List<String> selectDeptList(String result);
	
	public int insertBeforeStudent(BeforeStu s) throws Exception;
}
