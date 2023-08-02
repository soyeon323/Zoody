package com.kh.zoody.community.vo;

import lombok.Data;

@Data
public class BoardVo {
	
	private String rownum;
	private String no;
	private String userNo;
	private String catNo;
	private String title;
	private String content;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private String file;
	private String hit;
	
	private String viewItemCount;
	private String call;
}
