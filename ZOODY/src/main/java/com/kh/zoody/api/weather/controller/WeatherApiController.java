package com.kh.zoody.api.weather.controller;

import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.zoody.api.weather.setting.WeatherSetting;
import com.kh.zoody.api.weather.vo.WeatherVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

import java.io.BufferedReader;
import java.io.IOException;

@RestController
@RequestMapping("/api")
@Slf4j
public class WeatherApiController {
	
	@PostMapping("/weather")
	public Map<String, String> weatherInfo(WeatherVo vo) throws Exception {
		
		
		if (vo == null) {
			return null;
		}
		
		
		//날씨정보 얻기
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") +"=" + WeatherSetting.SERVICE_KEY ); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + Integer.toString(WeatherSetting.PAGE_NO) ); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(Integer.toString(WeatherSetting.NUM_OF_ROWS), "UTF-8") ); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(WeatherSetting.DATA_TYPE, "UTF-8") ); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(WeatherSetting.BASE_DATE, "UTF-8") ); /*‘21년 6월 28일발표*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(WeatherSetting.BASE_TIME, "UTF-8") ); /*05시 발표*/
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(vo.getNx(), "UTF-8") ); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(vo.getNy(), "UTF-8") ); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder.toString());
        
        log.info("url : " + url.toString());
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        // 데이터 정제
        String jsonStr = sb.toString();

        Gson gson = new Gson();
        Map<String, Object> jsonMap = gson.fromJson(jsonStr, Map.class);
        Map<String, Object> response = (Map<String, Object>) jsonMap.get("response");
        Map<String, Object> body = (Map<String, Object>) response.get("body");
        Map<String, Object> items = (Map<String, Object>) body.get("items");
        List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");

        // vo에 담을 데이터 Map 초기화
        Map<String, String> weatherDataMap = new HashMap<>();

        // 현재 날짜와 시간 정보 가져오기
        String baseDate = LocalDate.now().toString();
        baseDate = baseDate.replace("-", "");

        // fcstDate과 baseTime이 같은 데이터들의 category를 vo에 담는 로직
        for (Map<String, Object> item : itemList) {
            String fcstDate = (String) item.get("fcstDate");
            String fcstTime = (String) item.get("fcstTime");

            if (fcstDate.equals(baseDate)) {
                String category = (String) item.get("category");
                String fcstValue = (String) item.get("fcstValue");
                weatherDataMap.put(category, fcstValue);
            }
        }

        return weatherDataMap;
	
	}
}