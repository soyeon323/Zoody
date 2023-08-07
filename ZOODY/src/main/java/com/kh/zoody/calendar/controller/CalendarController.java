package com.kh.zoody.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.kh.zoody.user.vo.UserVo;

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
	public String listMonthMain(HttpSession session, Model model) {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String no = loginMember.getNo();
        
		return "calendar/month";
	}
	
	
	//json 으로 일정 정보 넘기기
	@GetMapping("list")
	@ResponseBody
	public List<Map<String, Object>> listMonth(HttpSession session, Model model) {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String userNo = loginMember.getNo();
        String departmentNo = loginMember.getDepartmentNo();
        
        CalendarVo cv = new CalendarVo();
        cv.setUserNo(userNo);
        cv.setDepartmentNo(departmentNo);
	
		
		List<Map<String, Object>> listAll = cs.listAll(cv);
		
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
			hash.put("id", listAll.get(i).get("NO"));
			hash.put("allDay", listAll.get(i).get("ALL_DAY"));
			hash.put("color", listAll.get(i).get("COLOR"));
//			hash.put("typeNo", listAll.get(i).get("CURRENT_NO"));
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
			
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	 }
	
	  @PostMapping("main")
	  @ResponseBody
	  public ResponseEntity<String> saveEvent(
		@RequestParam String allDay,
	    @RequestParam String title,
	    @RequestParam String startTime,
	    @RequestParam String place,
	    @RequestParam String endTime,
	    @RequestParam String typeNo,
	    @RequestParam String content, Model model, HttpSession session) {
		  
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String no = loginMember.getNo();

		CalendarVo vo = new CalendarVo();
		vo.setAllDay(allDay);
		vo.setTitle(title);
		vo.setPlace(place);
		vo.setStartTime(startTime);
		vo.setEndTime(endTime);
		vo.setTypeNo(typeNo);
		vo.setContent(content);
		vo.setUserNo(no);
		
		int result = cs.addMonth(vo);

	    return new ResponseEntity<>("일정이 성공적으로 저장되었습니다.", HttpStatus.OK);
	  }
	  
	  @PostMapping("update")
	  @ResponseBody
	  public ResponseEntity<String> updateEvent(
		@RequestParam String no,
		@RequestParam String allDay,
	    @RequestParam String title,
	    @RequestParam String startTime,
	    @RequestParam String place,
	    @RequestParam String endTime,
	    @RequestParam String typeNo,
	    @RequestParam String content) {

		CalendarVo vo = new CalendarVo();
		vo.setNo(no);
		vo.setAllDay(allDay);
		vo.setTitle(title);
		vo.setPlace(place);
		vo.setStartTime(startTime);
		vo.setEndTime(endTime);
		vo.setTypeNo(typeNo);
		vo.setContent(content);
		
		int result = cs.updateMonth(vo);

	    return new ResponseEntity<>("일정이 성공적으로 수정되었습니다.", HttpStatus.OK);
	  }
	  
	  @PostMapping("delete")
	  @ResponseBody
	  public ResponseEntity<String> deleteEvent(
		@RequestParam String no) {

		int result = cs.deleteMonth(no);

	    return new ResponseEntity<>("일정이 성공적으로 삭제되었습니다.", HttpStatus.OK);
	  }
	  
	  
	
	

}
