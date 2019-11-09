package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Subject {
	private String subYear;
	private String subCode;
	private String subName;
	private String tSubject;
	private String tDept;
	private int tGrade;
	private int completePt;
	private int tSemester;
	private String subType;
	private String deptCode;
	private String subDate;
	private String subTime;
	private String subRoom;
}
