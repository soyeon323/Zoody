package com.kh.zoody.attendance.vo;

import lombok.Data;

@Data
public class AttendanceVo {
	
	private String no;
	private String userNo;
	private String currentNo;
	private String enrolldate;
	private String checkInTime;
	private String checkOutTime;
	private String plusWorkTime;
	private String totalWorkTime;
	private String objectionReason;
	private String approvalStatus;

}
