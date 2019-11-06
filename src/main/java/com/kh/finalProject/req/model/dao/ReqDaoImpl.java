package com.kh.finalProject.req.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.req.model.vo.Req;

@Repository
public class ReqDaoImpl implements ReqDao {

	@Override
	public int insertReq(SqlSessionTemplate session, Req req) {
		return session.insert("req.insertReq",req);
	}

	@Override
	public List<Req> reqList(SqlSessionTemplate session) {
		return session.selectList("req.reqList");
	}

	@Override
	public Req reqOne(SqlSessionTemplate session, int reqNo) {
		return session.selectOne("req.reqOne",reqNo);
	}

	@Override
	public int answerUpdate(SqlSessionTemplate session, int reqNo) {
		return session.update("req.answerUpdate", reqNo);
	}

	@Override
	public int reqUpdate(SqlSessionTemplate session, int reqNo) {
		return session.update("req.reqUpdate",reqNo);
	}
	
	
	
	
	
	
	

}
