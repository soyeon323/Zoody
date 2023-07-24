package com.kh.zoody.api.weather.setting;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import com.kh.zoody.api.weather.vo.WeatherVo;

public interface WeatherSetting {
	
	/*
	 * 1. serviceKey
	 * 2. 페이지 번호
	 * 3. 한 페이지 결과 수
	 * 4. 요청자료형식(XML/JSON)
	 * 5. 예보 발표 일자 (Default: 오늘날짜)
	 * 6. 예보 발표 시간 (Default: 오늘날짜)
	 * 7 and 8. X , Y 좌표 (Default: 역삼1동)
	 */
	
	final String 	SERVICE_KEY = "kSsayJw1QBDC5zyNu%2FxgOVQQfrnF5qpx4bIbcrii82hA5GxKe%2FF%2Bx1Fy7Y7xHd0JRekCwY%2BEDKVeNTXnDqZpvQ%3D%3D";
	final int 		PAGE_NO 	= 1; 												
	final int 		NUM_OF_ROWS = 1000; 												
	final String 	DATA_TYPE 	= "JSON"; 												
	final String	BASE_DATE	= dynamicBaseDate();
	final String	BASE_TIME	= dynamicBaseTime();
	final int		NX			= 55;
	final int		NY			= 125;
	
	// 동적으로 현재 날짜에 맞춰 설정
	private static String dynamicBaseDate() {
        String now = LocalTime.now().format(DateTimeFormatter.ofPattern("HHmm"));
        int hour = Integer.parseInt(now.substring(0, 2));

        if (hour < 2) {
            LocalDate yesterday = LocalDate.now().minusDays(1);
            return yesterday.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        } else {
            return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        }
    }
	
	// 동적으로 현재 시간에 맞춰 설정
    private static String dynamicBaseTime() {
        String now = LocalTime.now().format(DateTimeFormatter.ofPattern("HHmm"));
        int hour = Integer.parseInt(now.substring(0, 2));

        if (hour < 2) {
            return "2300";
        } else if (hour < 5) {
            return "0200";
        } else if (hour < 8) {
            return "0500";
        } else if (hour < 11) {
            return "0800";
        } else if (hour < 14) {
            return "1100";
        } else if (hour < 17) {
            return "1400";
        } else if (hour < 20) {
            return "1700";
        } else if (hour < 23) {
            return "2000";
        } else {
            return "2300";
        }
    }
	
}
