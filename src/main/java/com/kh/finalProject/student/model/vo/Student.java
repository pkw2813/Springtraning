package com.kh.finalProject.student.model.vo;

import java.util.Date;

import com.kh.finalProject.professor.model.vo.Professor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
	
	private String stuNo;
	private String stuName;
	private String stuPw;
	private String stuSsn;
	private String stuTel;
	private String stuAddr;
	private String gender;
	private int deptCode;
	private Date enterDate;
	private String stuEmail;
	private String regStatus;
	private String profId;
	private String stuYearSem;
	private String conSemster;
	private String stuImg;
	private String stuAcount;

}
