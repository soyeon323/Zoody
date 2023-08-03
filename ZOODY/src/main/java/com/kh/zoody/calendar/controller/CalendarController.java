package com.kh.zoody.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
			
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	}
	
//	@GetMapping("list")
//    public String listMonth(Model model) {
//        List<Map<String, Object>> listAll = cs.listAll();
//
//        // FullCalendar에서 사용하는 events 배열
//        List<Map<String, Object>> events = new ArrayList<>();
//        
//        for (Map<String, Object> eventData : listAll) {
//            Map<String, Object> event = new HashMap<>();
//            event.put("title", eventData.get("TITLE"));
//            event.put("start", eventData.get("START_TIME"));
//            event.put("end", eventData.get("END_TIME"));
//            events.add(event);
//        }
//        
//        // Model에 events를 추가하여 JSP에서 사용할 수 있도록 함
//        model.addAttribute("events", events);
//        
//        return "calendar/month";
//    }
	
	
//	
//	@RequestMapping(value = "list", method = RequestMethod.GET)
//	public ModelAndView listMonth(ModelAndView mv, HttpServletRequest req) {
//		String viewpage = "calendar/month";
//		List<CalendarVo> cv = null;
//		cv = cs.getCalendar();
//		req.setAttribute("list", cv);
//		
//		mv.setViewName(viewpage);
//		return mv;
//	}
	
}
