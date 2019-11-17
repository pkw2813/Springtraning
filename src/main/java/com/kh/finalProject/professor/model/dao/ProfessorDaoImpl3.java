package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.dao.StudentDao3;

@Repository
public class ProfessorDaoImpl3 implements ProfessorDao3 {


	
	
	
	@Override
	public List<Map> gradeEdit(SqlSessionTemplate session,String profId) {
	
		return session.selectList("prof3.gradeEdit",profId);
	}

	@Override
	public List<Map> choiceClass(SqlSessionTemplate session, Map<String,Object> param) {
		
		return session.selectList("prof3.choiceClass",param);
	}

	
	@Override
	public Map<String, Object> stuInsertScore(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectOne("prof3.stuInsertScore",param);
	}

	
	
	
	@Override
	public int firstGrade(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.insert("prof3.firstGrade",param);
	}
	
	

	@Override
	public Map<String, Object> gradeFlag(SqlSessionTemplate session, Map<String, Object> param) {
	
		return session.selectOne("prof3.gradeFlag",param);
	}

	@Override
	public int updatePoint(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.update("prof3.updatePoint",param);
	}

	@Override
	public List<Map> studyList(SqlSessionTemplate session, String profId) {
	
		return session.selectList("prof3.studyList",profId);
	}

	
	
	
	
	
	
	
	
	
}
