package com.kh.finalProject.professor.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlanBoard {
	private int planNo;
	private String profName;
	private String planTitle;
	private String planContent;
	private Date planDate;
}
