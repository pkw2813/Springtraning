package com.kh.finalProject.employee.model.service;

import java.util.List;

import com.kh.finalProject.employee.model.vo.NoticeVo;

public interface NoticeService {

	//리스트 조회
	List<NoticeVo> selectNoticeList(int cPage, int numPerPage);
	//리스트 페이징 처리용 카운트 매퍼
	int countNoticeList();
	
	//공지사항 입력
	int insertNotice(NoticeVo noticeVo, List<NoticeVo> list) throws RuntimeException;
	
	//게시글 검색
	List<NoticeVo> selectNoticeByCode(NoticeVo noticeVo);
	
	//게시글 수정
	int updateNotice(NoticeVo noticeVo);
	
	//게시글 삭제
	int deleteNotice(NoticeVo noticeVo);
}
