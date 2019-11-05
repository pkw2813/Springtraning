package com.kh.finalProject.student.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tuition {
	private String stuNo;
	private String acaYearSem;
	private int tuition;
	private char paymentStat;
	private Date paymentDate;
	private Date dueDate;
	private char reductionStat;
}
