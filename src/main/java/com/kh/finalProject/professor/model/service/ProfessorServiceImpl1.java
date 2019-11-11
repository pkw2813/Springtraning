package com.kh.finalProject.professor.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.dao.ProfessorDao1;
import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.PlanBoard;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Service
public class ProfessorServiceImpl1 implements ProfessorService1 {

	@Autowired
	private ProfessorDao1 dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public String selectProfName() {
		
		String profName = dao.selectProfName(session);
		
		return profName;
	}
	//페이징 토탈데이타
	@Override
	public int selectBoardCount() {
		int totalData = dao.selectBoardCount(session);
		return totalData;
	}
	//강의 개설뷰
	@Override
	public List<InsertClass> insertSubject(){
		return dao.insertSubject(session);
	}
	//강의 개설
	@Override
	@Transactional
	public List<InsertClass> insertSubjectEnd(Map<String, String> map) throws RuntimeException {
		int result = 0;
		
		result = dao.selectSubCode(session,map);
		if(result==0) {
			result = dao.insertSubjectEnd(session, map); // insertClass
		}else {
			throw new RuntimeException();
		}
		if(result==0) {
			throw new RuntimeException();
		}
		List<InsertClass> list = dao.subjectView(session,map);
		
		return list;
		
//		int result = 0;
//		
//		result = dao.insertSubjectEnd(session, map); // insertClass
//		if(result==0) {
//			throw new RuntimeException();
//		}
//		List<InsertClass> list = dao.subjectView(session,map); 
//		
//		return list;
	}
	//강의 상세조회
	@Override
	public Map<String,String> selectSubjectView(Map<String,String> result){
		Map<String,String> map = dao.selectSubjectView(session, result);
		return map;
	}
	//강의 개설 YN
	@Override
	@Transactional
	public int subjectYn(String subCode) throws RuntimeException {
		int result = 0;
		
		result = dao.subjectYn(session, subCode);
		
		if(result==0) {
			throw new RuntimeException();
		}
		
		return result;
	}
	//교수뷰
	@Override
	public Professor professorView() {
		
		Professor p = dao.professorView(session);
		
		return p;
	}

	@Override
	public int updateProfessorEnd(Professor p) {
		
		int result = dao.updateProfessorEnd(session, p);
//		if(result>0) {session.commit();}
//		else {session.rollback();}
		
		return result;
	}
	
	@Override
	public int profUpdatePwdEnd(Map<String,String> map) {
		
		int result = dao.profUpdatePwdEnd(session, map);
		
		return result;
	}
	//게시판뷰
	@Override
	public List<ProfessorBoard> boardView(int cPage,int numPerPage){
		List<ProfessorBoard> list = dao.boardView(session,cPage,numPerPage);
		return list;
	}
	//게시판 작성
	@Override
	@Transactional
	public int insertBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException {
		int result = 0;
		
		result = dao.insertBoardEnd(session,pb);
		
		for(ProfBoardAttachment pba : list) {
			pba.setProfBoardNo(pb.getProfBoardNo());
			result = dao.insertBoardAttachment(session, pba);
			if(result==0) {
				throw new RuntimeException();
			}
		}
		
		return result;
		
	}
	//게시판 수정
	@Override
	@Transactional
	public int updateBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException{
		int result = 0;
		
		result = dao.updateBoardEnd(session,pb);
		
		for(ProfBoardAttachment pba : list) {
			pba.setProfBoardNo(pb.getProfBoardNo());
			result = dao.updateAttachment(session, pba);
		}
		if(result == 0) {
			throw new RuntimeException();
		}
		return result;
		
	}
	//게시판 삭제
	@Override
	@Transactional
	public int deleteBoard(ProfessorBoard pb, ProfBoardAttachment pba) throws RuntimeException {
		int result = 0;
		
		result = dao.deleteAttachment(session, pba);
		
		
		pb.setProfBoardNo(pba.getProfBoardNo());
		result = dao.deleteBoard(session, pb);
		
		if(result == 0) {
			throw new RuntimeException();
		}
		
		return result;
	}
//	게시판select
	@Override
	public ProfessorBoard selectBoardView(int profBoardNo) {
		return dao.selectBoardView(session, profBoardNo);
	}
	@Override
	public List<ProfBoardAttachment> selectProfAttachment(int profBoardNo) {
		return dao.selectProfAttachment(session, profBoardNo);
	}
//	과목코드 눌렀을때 보이는 뷰
	@Override
	public List<Subject> subjectCodeView(String profId){
		List<Subject> list = new ArrayList<Subject>();
		
		int result = dao.selectSubjectCode(session,profId);
		
		if(result==0) {
			list = dao.subjectCodeView(session,profId);
		}else {
			
		}
		return list;
	}
	//과목 코드불러오기
	@Override
	public Map<String,String> selectSubject(String subCode) {
		
		 Map<String,String> map = dao.selectSubject(session, subCode);
		
		return map;
	}
	//강의 계획서 게시판
	@Override
	public List<PlanBoard> planBoardView(){
		
		List<PlanBoard> list = dao.planBoardView(session);
		
		return list;
	}
}
