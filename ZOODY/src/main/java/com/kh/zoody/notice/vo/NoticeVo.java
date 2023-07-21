package com.kh.zoody.notice.vo;

import lombok.Data;

@Data
public class NoticeVo {

	private String no;
	private String adminNo;
	private String categoryNo;
	private String title;
	private String content;
	private String enrollDate;
	private String status;
	private String originName;
	private String changeName;
	private String rightclickYn;
	private String commnetYn;
	private String boardLimit;
	private String hit;
}
