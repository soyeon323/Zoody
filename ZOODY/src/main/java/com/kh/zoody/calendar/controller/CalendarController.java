package com.kh.zoody.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.zoody.calendar.service.CalendarService;
import com.kh.zoody.calendar.vo.CalendarVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("calendar")
@RequiredArgsConstructor
@Slf4j
public class CalendarController {
	
	private final CalendarService cs;
	
	//달력 (화면)
	@GetMapping("main")
	public String listMonthMain() {
		return "calendar/month";
	}
	
	
	//json 으로 일정 정보 넘기기
	@GetMapping("list")
	@ResponseBody
	public List<Map<String, Object>> listMonth() {
		
		List<Map<String, Object>> listAll = cs.listAll();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		for (int i = 0; i < listAll.size(); i++) {
			hash.put("title", listAll.get(i).get("TITLE"));
			hash.put("start", listAll.get(i).get("START_TIME"));
			hash.put("end", listAll.get(i).get("END_TIME"));
			hash.put("type", listAll.get(i).get("TYPE"));
			hash.put("username", listAll.get(i).get("NAME"));
			hash.put("description", listAll.get(i).get("CONTENT"));
			hash.put("_id", listAll.get(i).get("NO"));
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
			
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	}
	
		@PostMapping("main")
	  @ResponseBody
	  public ResponseEntity<String> saveEvent(
	    @RequestParam String title,
	    @RequestParam String startTime,
	    @RequestParam String place,
	    @RequestParam String endTime,
	    @RequestParam String typeNo,
	    @RequestParam String content) {

	    // calendarService.saveEvent(title, start, end, type, description);
		CalendarVo vo = new CalendarVo();
		vo.setTitle(title);
		vo.setPlace(place);
		vo.setStartTime(startTime);
		vo.setEndTime(endTime);
		vo.setTypeNo(typeNo);
		vo.setContent(content);
		
		int result = cs.addMonth(vo);

	    return new ResponseEntity<>("일정이 성공적으로 저장되었습니다.", HttpStatus.OK);
	  }
	
	

}
