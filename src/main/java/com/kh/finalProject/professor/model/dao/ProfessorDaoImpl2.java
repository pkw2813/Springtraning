package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.InClassStudent;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.professor.model.vo.Select_ClassInfo;
import com.kh.finalProject.professor.model.vo.Select_SubjectNameCode;
import com.kh.finalProject.student.model.vo.Student;

@Repository
public class ProfessorDaoImpl2 implements ProfessorDao2 {

	@Override
	public List<Student> selectInMajor(SqlSessionTemplate session, SelectInMajor sim, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof2.selectInMajor", sim, row);
	}

	@Override
	public int countInDept(SqlSessionTemplate session, SelectInMajor sim) {
		return session.selectOne("prof2.countInDept",sim);
	}

	@Override
	public List<String> selectPreSubject(SqlSessionTemplate session, Professor p) {
		return session.selectList("prof2.selectPreSubject", p);
	}

	@Override
	public List<Select_SubjectNameCode> selectPreSubjectNameo(SqlSessionTemplate session, Professor p) {
		return session.selectList("prof2.selectPreSubjectName", p);
	}

	@Override
	public List<InClassStudent> selectInClass(SqlSessionTemplate session, SelectInClass sic, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof2.selectInClass", sic, row);
	}

	@Override
	public int countInClass(SqlSessionTemplate session, SelectInClass sic) {
		return session.selectOne("prof2.countInClass",sic);
	}

	@Override
	public Select_ClassInfo selectClassInfo(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectOne("prof2.selectClassInfo", map);
	}
	
	
	
	
	
	
	
	
	
	
}
