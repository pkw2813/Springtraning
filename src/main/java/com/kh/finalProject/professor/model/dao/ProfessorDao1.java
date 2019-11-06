package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

public interface ProfessorDao1 {

	String selectProfName(SqlSessionTemplate session);
	//페이징 토탈데이타
	int selectBoardCount(SqlSessionTemplate session);
	//강의 개설
//	Map<String,String> insertSubjectEnd(SqlSessionTemplate session, MultipartFile upfile, Map<String, String> map);
//	
//	Map<String,String> selectSubjectView(SqlSessionTemplate session, int subcode);
//	
//	int insertClassEnd(SqlSessionTemplate session, MultipartFile upfile, Map<String, String> map);
	//교수뷰
	Professor professorView(SqlSessionTemplate session);
	//교수 정보수정
	int updateProfessorEnd(SqlSessionTemplate session, Professor p);
	//교수 비번
	int profUpdatePwdEnd(SqlSessionTemplate session, Map<String,String> map);
	//게시판뷰
	List<ProfessorBoard> boardView(SqlSessionTemplate session,int cPage,int numPerPage);
	//게시판 작성
	int insertBoardEnd(SqlSessionTemplate session,ProfessorBoard pb);
	int insertBoardAttachment(SqlSessionTemplate session, ProfBoardAttachment pba);
//	subject
	List<Subject> subjectCodeView(SqlSessionTemplate session);
	Map<String,String> selectSubject(SqlSessionTemplate session, String subCode);
}
