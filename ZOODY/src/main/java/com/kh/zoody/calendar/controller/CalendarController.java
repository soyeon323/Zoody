package com.kh.zoody.calendar.controller;

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
	
	
	@GetMapping("list")
//	@ResponseBody
	public String listMonth(Model model) {
		
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
		
		model.addAttribute("jsonArr", jsonArr);
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return "calendar/month";
	}
	
	
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
