package com.kh.zoody.api.weather.vo;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import lombok.Getter;

@Getter
public class WeatherVo {
	
	public WeatherVo(String serviceKey, String pageNo, int numOfRows, String dataType, LocalDate base_date, LocalTime base_time,
			int nx, int ny) {
		this.serviceKey = "kSsayJw1QBDC5zyNu%2FxgOVQQfrnF5qpx4bIbcrii82hA5GxKe%2FF%2Bx1Fy7Y7xHd0JRekCwY%2BEDKVeNTXnDqZpvQ%3D%3D";
		this.pageNo = "1";  			// 페이지 번호
		this.numOfRows = "10";		// 한 페이지 결과 수
		this.dataType = "JSON";	// 요청자료형식(XML/JSON)
		this.baseDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")).toString(); // 예보 발표 일자 (Default: 오늘날짜)
		this.baseTime = LocalTime.now().format(DateTimeFormatter.ofPattern("HHmm")).toString();
		this.nx = "55"; // (Default: 역삼1동)
		this.ny = "125"; // (Default: 역삼1동)
	}
	
	private String serviceKey;
	private String pageNo;
	private String numOfRows;
	private String dataType;
	private String baseDate; 	
	private String baseTime;	
	private String nx;
	private String ny;
	
	
	
	
	
	
}
