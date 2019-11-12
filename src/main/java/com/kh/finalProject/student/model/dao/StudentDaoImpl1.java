package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Student;

@Repository
public class StudentDaoImpl1 implements StudentDao1 {

	@Override
	public Student selectStudent(SqlSessionTemplate session, String studentNo) {
	
		return session.selectOne("student1.selectStudent",studentNo);
	}

	@Override
	public int studentInfoUpdate(SqlSessionTemplate session, Student s) {
		// TODO Auto-generated method stub
		return session.update("student1.studentInfoUpdate",s);
	}

	@Override
	public List<Map> selectAllClass(SqlSessionTemplate session,String stuId,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("student1.selectAllClass",stuId,row);
		
		
	}

	@Override
	public List<Map> selectClass(SqlSessionTemplate session, Map<String, Object> param,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("student1.selectClass",param,row);
	}

	@Override
	public int countAllClass(SqlSessionTemplate session,String stuId) {
		
		return session.selectOne("student1.countAllClass",stuId);
	}

	@Override
	public int countSelectClass(SqlSessionTemplate session,Map<String, Object> param) {
		
		return session.selectOne("student1.countSelectClass",param);
	}

	@Override
	public List<Map> selectProfEval(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectList("student1.selectProfEval",param);
	}

	@Override
	public Map selectProfInfo(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectOne("student1.selectProfInfo",param);
	}

	@Override
	public int applyClass(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.insert("student1.applyClass",param);
	}

	@Override
	public List<Map> selectApplyClass(SqlSessionTemplate session, String stuNo) {
		
		
		return session.selectList("student1.selectApplyClass",stuNo);
	}

	@Override
	public double averPoint(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectOne("student1.averPoint",param);
	}

	@Override
	public int cancelClass(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.delete("student1.cancelClass",param);
	}

	@Override
	public List<Map> selectMyApplyClass(SqlSessionTemplate session, String stuId) {
		// TODO Auto-generated method stub
		return session.selectList("student1.selectMyApplyClass");
	}

	@Override
	public List<Map> myApplyClass(SqlSessionTemplate session,String stuId,int cPage,int numPerPage) {
		
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("student1.myApplyClass",stuId,row);
		
	}

	@Override
	public int countMyApplyClass(SqlSessionTemplate session,String stuId) {
		// TODO Auto-generated method stub
		return session.selectOne("student1.countMyApplyClass",stuId);
	}
	
	
	@Override
	public int cancelMyClass(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.delete("student1.cancelMyClass",param);
	}
	
	@Override
	public List<Map> selectMyClass(SqlSessionTemplate session, Map<String, Object> param,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("student1.selectMyClass",param,row);
	}

	@Override
	public int countSelectMyClass(SqlSessionTemplate session,Map<String, Object> param) {
		
		return session.selectOne("student1.countSelectMyClass",param);
	}

	
	
	
	

}
