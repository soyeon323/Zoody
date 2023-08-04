package com.kh.zoody.document.vo;

import lombok.Data;

@Data
public class DocumentVo {
	
	private String no;
	private String userNo;
	private String name;
	private String department; //부서
	private String catNo; // 카테고리
	private String directoryName; 
	
	private String fileName; 
	private String extension; //확장자
	
	private String enollDate; 
	private String modify_date;
	private String status;
	
	
	
}
