package com.kh.finalProject.student.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StuTuition {
	private String stuNo;
	private String acaYearSem;
	private String acaYearSemKor;
	private int tuition;
	private char paymentStat;
	private String paymentDate;
	private String dueDate;
	private char reductionStat;
	private String stuName;
	private String deptName;
	private String birthday;
}
