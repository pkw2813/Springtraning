package com.kh.finalProject.req.model.service;

import java.util.List;

import com.kh.finalProject.req.model.vo.Req;

public interface ReqService {
	
	int insertReq(Req req) throws Exception;
	List<Req> reqList();
	Req reqOne(int reqNo);
	int answerUpdate(int reqNo);
	int reqUpdate(int reqNo);

}
