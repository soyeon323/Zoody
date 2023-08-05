package com.kh.zoody.meetingroom.vo;

import lombok.Data;

@Data
public class MeetingroomReservationVo {
	
	private String no;
	private String meetingroomNo;
	private String date;
	private String startTime;
	private String endTime;
	private String status;
	
	private String voNo;

}
