package com.kh.zoody.approval.vo;

import lombok.Data;

@Data
public class LeaveVo {
	
	private String no;
	private String userNo;
	private String leaveNo;
	private String proxyNo;
	private String enrolldate;
	private String reasonContent;
	private String startTime;
	private String endTime;
	private String status;
}
