package com.kh.finalProject.req.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.req.model.vo.Req;

public interface ReqDao {
	
	int insertReq(SqlSessionTemplate session,Req req);

}
