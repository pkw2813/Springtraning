package com.kh.finalProject.beforeStudent.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

public interface BeforeStuService {

	public List<Map> selectColList();
	
	public List<Map> selectDeptList(String result);
	
	public int insertBeforeStudent(BeforeStu s) throws Exception;
}
