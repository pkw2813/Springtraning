package com.kh.finalProject.professor.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

public interface ProfessorService1 {
	//페이징 토탈데이타
	int selectBoardCount();
	String selectProfName();
	//강의뷰
	List<InsertClass> insertSubject();
//	Map<String,String> insertSubjectEnd(MultipartFile upfile,Map<String, String>map) throws RuntimeException;
	//강의개설
	List<InsertClass> insertSubjectEnd(Map<String, String>map) throws RuntimeException;
	//강의 상세조회
	Map<String,String> selectSubjectView(String subCode);
	//강의개설 YN
	int subjectYn(String subCode) throws RuntimeException;
	//교수뷰
	Professor professorView();
	//교수 정보수정
	int updateProfessorEnd(Professor p);
	//교수 비번변경
	int profUpdatePwdEnd(Map<String,String> map);
	//게시판뷰
	List<ProfessorBoard> boardView(int cPage,int numPerPage);
	//게시판 작성
	int insertBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException;
	//게시판 수정
	int updateBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException;
	//게시판 삭제
	int deleteBoard(ProfessorBoard pb, ProfBoardAttachment pba) throws RuntimeException;
	//게시판select
	ProfessorBoard selectBoardView(int profBoardNo);
	List<ProfBoardAttachment> selectProfAttachment(int profBoardNo);
	//subject조회
	List<Subject> subjectCodeView(String profId);
	Map<String,String> selectSubject(String subCode);
}
