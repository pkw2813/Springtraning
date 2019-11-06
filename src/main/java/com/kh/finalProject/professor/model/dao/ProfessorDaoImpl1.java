package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Repository
public class ProfessorDaoImpl1 implements ProfessorDao1 {
	
	@Override
	public String selectProfName(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectProfName");
	}
	//페이징 토탈데이타
	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectBoardCount");
	}
	//강의 개설
//	@Override
//	public int insertSubjectEnd(SqlSessionTemplate session, MultipartFile upfile, Map<String, String> map) {
//		return session.insert("professor1.insertSubjectEnd",map);
//	}

//	@Override
//	public int insertClassEnd(SqlSessionTemplate session, MultipartFile upfile, Map<String, String> map) {
//		return session.insert("professor1.insertClassEnd", map);
//	}
	
	//교수뷰
	@Override
	public Professor professorView(SqlSessionTemplate session) {
		return session.selectOne("professor1.professorView");
	}

	@Override
	public int updateProfessorEnd(SqlSessionTemplate session, Professor p) {
		
//		return session.insert("professor1.updateProfessor",profId);
		return session.update("professor1.updateProfessor",p);
		
	}
	
	@Override
	public int profUpdatePwdEnd(SqlSessionTemplate session, Map<String,String> map) {
		
		return session.update("professor1.profUpdatePwdEnd",map);
	}
	//게시판뷰
	@Override
	public List<ProfessorBoard> boardView(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor1.boardView",null,row);
	}
	//게시판 작성
	
	@Override
	public int insertBoardEnd(SqlSessionTemplate session,ProfessorBoard pb) {
		return session.insert("professor1.insertBoardEnd",pb);
	}
	@Override
	public int insertBoardAttachment(SqlSessionTemplate session, ProfBoardAttachment pba) {
		return session.insert("professor1.insertBoardAttachment",pba);
	}
	//게시판 상세
	@Override
	public ProfessorBoard selectBoardView(SqlSessionTemplate session, int profBoardNo) {
		return session.selectOne("professor1.selectBoardView",profBoardNo);
	}
	@Override
	public List<ProfBoardAttachment> selectProfAttachment(SqlSessionTemplate session, int profBoardNo) {
		return session.selectList("professor1.selectProfAttachment",profBoardNo);
	}
//	subject
	@Override
	public List<Subject> subjectCodeView(SqlSessionTemplate session){
		return session.selectList("professor1.subjectCodeView");
	}
	@Override
	public Map<String,String> selectSubject(SqlSessionTemplate session, String subCode) {
		return session.selectOne("professor1.selectSubject",subCode);
	}
}
