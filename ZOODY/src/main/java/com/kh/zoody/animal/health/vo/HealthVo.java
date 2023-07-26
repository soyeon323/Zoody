package com.kh.zoody.animal.health.vo;

import lombok.Data;

@Data
public class HealthVo {

	private String no;
	private String animalNo;
	private String stateOfHealth;   //건강 상태
	private String disease;   // 질병
	private String checkupDate;
	private String lifeStyleManagement; //생활습관 관리
	private String nickName;
	private String status;
}
