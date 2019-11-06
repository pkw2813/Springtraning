package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Repository
public class ProfessorDaoImpl1 implements ProfessorDao1 {
	
	@Override
	public String selectProfName(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectProfName");
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
	
	//게시판 작성
	
	@Override
	public int insertBoardEnd(SqlSessionTemplate session,List<ProfessorBoard> list) {
		return session.insert("professor1.insertBoardEnd",list);
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
