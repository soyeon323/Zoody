package com.kh.zoody.meetingroom.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.meetingroom.service.MeetingroomService;
import com.kh.zoody.meetingroom.vo.MeetingroomReservationVo;
import com.kh.zoody.meetingroom.vo.MeetingroomVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("meetingroom")
@RequiredArgsConstructor
@Slf4j
public class MeetingroomController {
	
	private final MeetingroomService ms;
	
	//회의실 예약 (회의실 목록보기)
	@GetMapping("reserve")
	public String reserve(Model model) throws Exception {
		
		List<MeetingroomVo> list = ms.selectList();
		model.addAttribute("list", list);
		
//		List<MeetingroomVo> timeList = ms.reserveTime();
//		model.addAttribute("timeList", timeList);
		
//		log.info(timeList.toString());
		
		return "meetingroom/reserve";
	}
	
//	@GetMapping("reserve/time")
//	public String timeList(Model model, @RequestParam String voNo) {
//		List<MeetingroomVo> timeList = ms.reserveTime(voNo);
//		model.addAttribute("timeList", timeList);
//		
//		return "meetingroom/reserve";
//	}
	
	@GetMapping("/time")
	@ResponseBody
    public ResponseEntity<List<String>> getReservedTimes(@RequestParam String meetingroomNo, @RequestParam String date) {
        List<String> reservedTimes = ms.getReservedTimes(meetingroomNo, date);
        
        log.info("회의실 예약 배열 : {}", reservedTimes);
        
        return ResponseEntity.ok(reservedTimes);
    }

	@PostMapping("reserve")
	public String reserve(Model model, 
			HttpSession session,
			@RequestParam String meetingroomNo,
			@RequestParam String startTime,
			@RequestParam String date
			) {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String userNo = loginMember.getNo();
        
        MeetingroomReservationVo mrv = new MeetingroomReservationVo();
        mrv.setMeetingroomNo(meetingroomNo);
        mrv.setStartTime(startTime);
        mrv.setDate(date);
        mrv.setUserNo(userNo);
        
        int result = ms.addReserve(mrv);
		
		return "meetingroom/reserve";
	}
	
//	@GetMapping("time")
//	@ResponseBody
//	public List<Map<String, Object>> time(@RequestParam String meetingroomNo){
//
//		
//		List<Map<String, Object>> timeList = ms.reserveTime(meetingroomNo);
//		
//		JSONObject jsonObj = new JSONObject();
//		JSONArray jsonArr = new JSONArray();
//		
//		HashMap<String, Object> hash = new HashMap<>();
//		
//		for (int i = 0; i < timeList.size(); i++) {
//			hash.put("meetingroomNo", timeList.get(i).get("MEETINGROOM_NO"));
//			hash.put("start", timeList.get(i).get("START_TIME"));
//			hash.put("end", timeList.get(i).get("END_TIME"));
//			
//			jsonObj = new JSONObject(hash);
//			jsonArr.add(jsonObj);
//			
//		}
//		
//		log.info("jsonArrCheck: {}", jsonArr);
//		
//		return jsonArr;
//	}
	
	//회의실 추가 (화면)
	@GetMapping("add")
	public String add() {
		return "meetingroom/add";
	}
	
	//회의실 추가
	@PostMapping("add")
	public String add(MeetingroomVo mvo, MultipartFile file) {
		
		int result = ms.addMeetingroom(mvo, file);
		
		return "meetingroom/add";
	}
	
	@PostMapping("reserve/update")
	public String mtUpdate(Model model, MeetingroomVo mvo, MultipartFile file) {
		int update = ms.updateMeetingroom(mvo, file);
		
		if (update == 1) {
			return "redirect:/meetingroom/reserve";
		}
		
		return "meetingroom/update";
	}
	
	//수정하기 (화면)
	@GetMapping("reserve/update")
	public String mtUpdate(Model model,String no) {
		
		MeetingroomVo detail = ms.selectDetail(no);
		
		model.addAttribute("detail", detail);
		
		return "meetingroom/update";
	}
	
	
	//삭제하기 (화면)
	@GetMapping("reserve/delete")
	public String mtDelete() {
		return "meetingroom/reserve";
	}
	
	//삭제하기
	@PostMapping("reserve/delete")
	public String mtDelete(@RequestParam String no) {
		
		int result = ms.mtDelete(no);
		
		return "meetingroom/reserve";
	}
	
	//회의실 예약 조회

}
