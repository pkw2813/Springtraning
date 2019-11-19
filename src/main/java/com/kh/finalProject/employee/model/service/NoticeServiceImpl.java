package com.kh.finalProject.employee.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.employee.model.dao.NoticeDao;
import com.kh.finalProject.employee.model.vo.NoticeVo;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	NoticeDao dao;
	
	
	@Override
	public List<NoticeVo> selectNoticeList(int cPage, int numPerPage) {
		List<NoticeVo> list = dao.selectNoticeList(session, cPage, numPerPage);
		return list;
	}
	
	

	@Override
	public int countNoticeList() {
		int result = dao.countNoticeList(session);
		return result;
	}



	@Override
	public int insertNotice(NoticeVo noticeVo) {
		int result = dao.insertNotice(session, noticeVo);
		return result;
	}

	@Override
	public List<NoticeVo> selectNoticeByCode(NoticeVo noticeVo) {
		List<NoticeVo> resultVo = dao.selectNoticeByCode(session, noticeVo);
		return resultVo;
	}

	@Override
	public int updateNotice(NoticeVo noticeVo) {
		int result =  dao.updateNotice(session, noticeVo);
		return result;
	}

	@Override
	public int deleteNotice(NoticeVo noticeVo) {
		int result = dao.deleteNotice(session, noticeVo);	
		return result;
	}

	
	
	
	
}
