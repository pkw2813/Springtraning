package com.kh.finalProject.employee.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.employee.model.vo.NoticeVo;


@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<NoticeVo> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("notice.selectNoticeList","",row);
	}

	@Override
	public int countNoticeList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.countNoticeList");
	}



	@Override
	public int insertNotice(SqlSessionTemplate session, NoticeVo noticeVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeVo> selectNoticeByCode(SqlSessionTemplate session, NoticeVo noticeVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateNotice(SqlSessionTemplate session, NoticeVo noticeVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(SqlSessionTemplate session, NoticeVo noticeVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
