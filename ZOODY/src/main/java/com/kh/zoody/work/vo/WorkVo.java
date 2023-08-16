package com.kh.zoody.work.vo;

import lombok.Data;

@Data
public class WorkVo {

	//업무행위자
	private String userNo;
	private String userName;
	private String deptName;
	
	//업무
	private String workNo;
	private String workName;
	private String workContent;
	private String endDate;
	private String workStatus;
	
	//checkList
	private String checkListName;
	private String checkListStatus;
}
