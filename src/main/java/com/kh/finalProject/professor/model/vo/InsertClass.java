package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class InsertClass {
	private String subCode;
	private String classYear;
	private String className;
	private String profId;
	private String openYn;
	private int capacity;
	private String classStart1;
	private String classStart2;
	private String classStart3;
	private String classRoom;
	private int assignA;
	private int assignB;
	private int assignC;
	private int assignD;
	private int mTerm;
	private int fTerm;
	private int statusGrade;
	private String useBook;
	private String bookName;
	private String bookAuthor;
	private String evaStan;
	private String classLang;
	private String openOther;
	private String clOriFileName;
	private String clReFileName;
}
