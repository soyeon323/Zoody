package com.kh.zoody.work.vo;

import lombok.Data;

@Data
public class WorkVo {

	//업무행위자
//	private String no; //업무번호
	private String userNo;
	
	
	//업무
	private String workNo;
	private String workName;
	private String workContent;
	private String date;
	private String workStatus;
	
	//checkList
//	private String no; //업무번호
	private String chaekListName;
	private String checkListStatus;
}
