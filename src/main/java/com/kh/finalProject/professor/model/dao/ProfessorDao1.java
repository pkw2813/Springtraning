package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.PlanBoard;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

public interface ProfessorDao1 {

	String selectProfName(SqlSessionTemplate session);
	//게시판 페이징 토탈데이타
	int selectBoardCount(SqlSessionTemplate session);
	//강의계획서 토탈데이타
	int selectPlanCount(SqlSessionTemplate session);
	//subject 토탈데이타
	int selectSubjectCount(SqlSessionTemplate session, String profId);
	//강의 개설뷰
	List<InsertClass> insertSubject(SqlSessionTemplate session);
	//강의 개설
	int selectSubCode(SqlSessionTemplate session, Map<String,String> map);
	int insertSubjectEnd(SqlSessionTemplate session, Map<String, String> map);
	List<InsertClass> subjectView(SqlSessionTemplate session,Map<String,String> map);
	//강의 상세조회
	Map<String,String> selectSubjectView(SqlSessionTemplate session, Map<String,String> result);
//	int insertClassEnd(SqlSessionTemplate session, MultipartFile upfile, Map<String, String> map);
//	
//	Map<String,String> selectSubjectView(SqlSessionTemplate session, int subcode);
	//강의 개설 YN
	int subjectYn(SqlSessionTemplate session, String subCode);
	//교수뷰
	List<Subject> professorView(SqlSessionTemplate session,String profId);
	//교수 정보수정
	int updateProfessorEnd(SqlSessionTemplate session, Professor p);
	//교수 비번
	int profUpdatePwdEnd(SqlSessionTemplate session, Map<String,String> map);
	//게시판뷰
	List<ProfessorBoard> boardView(SqlSessionTemplate session,int cPage,int numPerPage);
	//게시판 작성
	int insertBoardEnd(SqlSessionTemplate session,ProfessorBoard pb);
	int insertBoardAttachment(SqlSessionTemplate session, ProfBoardAttachment pba);
	//게시판 수정
	int updateBoardEnd(SqlSessionTemplate session, ProfessorBoard pb);
	int updateAttachment(SqlSessionTemplate session, ProfBoardAttachment pba);
	//게시판 삭제
	int deleteBoard(SqlSessionTemplate session, ProfessorBoard pb);
	int deleteAttachment(SqlSessionTemplate session, ProfBoardAttachment pba);
	//게시판 상세
	ProfessorBoard selectBoardView(SqlSessionTemplate session, int profBoardNo);
	List<ProfBoardAttachment> selectProfAttachment(SqlSessionTemplate session, int profBoardNo);
//	subject
	List<Subject> subjectCodeView(SqlSessionTemplate session,int cPage, int numPerPage, String profId);
	Map<String,String> selectSubject(SqlSessionTemplate session, String subCode);
//	과목코드 눌렀을때 보이는 뷰
	int selectSubjectCode(SqlSessionTemplate session, String profId);
	//강의 계획서 뷰
	List<PlanBoard> planBoardView(SqlSessionTemplate session,int cPage,int numPerPage);
	//강의 계획서 작성
	int insertPlanEnd(SqlSessionTemplate session,PlanBoard p);
	//강의 계획서 select
	PlanBoard selectPlanView(SqlSessionTemplate session, int planNo);
	//강의 계획서 수정
	int updatePlanEnd(SqlSessionTemplate session, Map<String,String> map);
}
