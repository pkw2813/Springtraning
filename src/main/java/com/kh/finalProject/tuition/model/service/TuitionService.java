package com.kh.finalProject.tuition.model.service;

import com.kh.finalProject.tuition.model.vo.Tuition;

public interface TuitionService {
	
	Tuition selectOne(String tuiYear,String deptCode);
	int insertTuition(Tuition t);

}
