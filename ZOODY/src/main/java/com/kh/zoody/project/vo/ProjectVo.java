package com.kh.zoody.project.vo;

import java.util.List;

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
	
	private String projectNo;
	private List<String> userNo;
	private List<String> userName;
}
