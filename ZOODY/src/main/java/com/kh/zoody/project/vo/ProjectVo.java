package com.kh.zoody.project.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProjectVo {
	private String no;
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	private String teamName;
	
	private String userName;
	private String userNo;
}
