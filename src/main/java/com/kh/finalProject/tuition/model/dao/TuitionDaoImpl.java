package com.kh.finalProject.tuition.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.tuition.model.vo.Tuition;

@Repository
public class TuitionDaoImpl implements TuitionDao {

	@Override
	public Tuition selectOne(SqlSessionTemplate session, String tuiYear, String deptCode) {
		Tuition t=new Tuition();
		t.setTuiYear(tuiYear);
		t.setDeptCode(deptCode);
		System.out.println(t);
		return session.selectOne("tuition.selectOne", t);
	}

	@Override
	public int insertTuition(SqlSessionTemplate session,Tuition t) {
		System.out.println(t);
		return session.insert("tuition.insertTuition",t);
	}
	
	
	
	

}
