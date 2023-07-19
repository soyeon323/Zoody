package com.kh.zoody.api.weather.vo;

import lombok.Data;

@Data
public class WeatherVo {
	
	private String serviceKey;
	private String pageNo;
	private String numOfRows;
	private String dataType;
	private String baseDate; 	
	private String baseTime;	
	private String nx;
	private String ny;
	
}
