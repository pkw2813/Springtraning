package com.kh.finalProject.schedule.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Schedule {

	
	
	private int planNo;
	private String planName;
	private Date stDate;
	private Date enDate;
	private String deptCode;
}
