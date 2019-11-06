package com.kh.finalProject.req.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.req.model.vo.Req;

public interface ReqDao {
	
	int insertReq(SqlSessionTemplate session,Req req);
	List<Req> reqList(SqlSessionTemplate session);
	Req reqOne(SqlSessionTemplate session,int reqNo);
}
