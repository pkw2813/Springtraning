package com.kh.finalProject.beforeStudent.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.beforeStudent.model.dao.BeforeStuDao;

@Service
public class BeforeStuServiceImpl implements BeforeStuService{

	@Autowired
	private BeforeStuDao dao;
	
}
