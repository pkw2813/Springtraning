package com.kh.finalProject.professor.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.student.model.vo.Student;

@Repository
public class ProfessorDaoImpl2 implements ProfessorDao2 {

	@Override
	public List<Student> selectInMajor(SqlSessionTemplate session, SelectInMajor sim, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof2.selectInMajor", sim, row);
	}

	@Override
	public int countInDept(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("prof2.countInDept",deptCode);
	}

	
	
}
