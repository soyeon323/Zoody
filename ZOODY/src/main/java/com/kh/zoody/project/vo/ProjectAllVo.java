package com.kh.zoody.project.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ProjectAllVo {
	private String no;
	private List<String> userNo;
	private List<String> userName;
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	private String teamName;
}
