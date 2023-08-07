package com.kh.zoody.document.vo;

import lombok.Data;

@Data
public class DocumentVo {
	
	private String rownum;
	private String no;
	private String scope;
	private String userNo;
	private String name;	//작성자 이름 
	private String directoryNo; //디렉토리 번호
	private String directoryName; //디렉토리 이름
	
	private String fileName; //파일이름
	private String extension; //확장자
	
	private String enrollDate; 
	private String modify_date;
	private String status;
	
	private String loginMemberId;
	
}
