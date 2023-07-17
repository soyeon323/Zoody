package com.kh.zoody.api.weather.controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.zoody.api.weather.service.WeatherService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

import java.io.BufferedReader;
import java.io.IOException;

@Slf4j
//@RestController
//@RequestMapping("/api")
@RequiredArgsConstructor
public class WeatherApiController {
	
	public static final String SERVICE_KEY = "kSsayJw1QBDC5zyNu%2FxgOVQQfrnF5qpx4bIbcrii82hA5GxKe%2FF%2Bx1Fy7Y7xHd0JRekCwY%2BEDKVeNTXnDqZpvQ%3D%3D";
	
	
//	private final WeatherService ws;
	private final Gson gson;
	
	
	// 클라이언트 url 매핑
	@PostMapping(value = "/weather", produces = "lication/json; charset=utf8")
	public String weather() {
			
		// 요청 변수
		int	numOfRows = 10;		// 한 페이지 결과 수
		String dataType	= "JSON";	// 요청자료형식(XML/JSON)
		LocalDate base_date	= LocalDate.now(); // 예보 발표 일자 (Default: 오늘날짜)	
		LocalTime base_time = LocalTime.now(); // 예보 발표 시간 (Default: 현재시간)	
		int nx = 61; // (Default: 역삼1동)
		int ny = 125; // (Default: 역삼1동)
		
		
		// url 생성
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst\r\n"
				+ "?serviceKey= "+ SERVICE_KEY
				+ "&numOfRows=" + numOfRows
				+ "&pageNo=1"
				+ "&base_date=" + base_date
				+ "&base_time=" + base_time
				+ "&dataType=" + dataType
				+ "&nx=" + 61
				+ "&ny=" + 125
				; 
		
		return null;
	}
	
   
}