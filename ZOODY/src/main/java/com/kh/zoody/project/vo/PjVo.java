package com.kh.zoody.project.vo;

import java.util.List;

import lombok.Data;

@Data
public class PjVo {

	private List<String> userNo;
	private List<String> userName;
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	
}
