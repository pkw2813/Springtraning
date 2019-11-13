package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendStudent {
	
	public AttendStudent(String stuName){
		this.setStuName(stuName);
	}
	
	
	private String stuNo;
	private String subCode;
	private String profId;
	private String grade;
	private String stuName;
	private String deptCode;
	private String deptName;
	private String acaYearSem;
	private String subYear;
	private String subSemester;
	private String attend;
	private String dismiss;
	private String late;
	private String ealryLeave;
	private String sysdate;
	
	

}
