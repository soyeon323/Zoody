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
import org.springframework.http.HttpStatus;
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
	public String reserve(Model model, HttpSession session) throws Exception {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String userNo = loginMember.getNo();
		
		List<MeetingroomVo> list = ms.selectList();
		model.addAttribute("list", list);
		
		List<MeetingroomReservationVo> reserveList = ms.selectReserveList(userNo);
		model.addAttribute("reserveList", reserveList);
		
//		List<MeetingroomVo> timeList = ms.reserveTime();
//		model.addAttribute("timeList", timeList);
//		
//		log.info(timeList.toString());
//		
//		List<MeetingroomReservationVo> reList = ms.reserveTimeList(meetingroomNo, date);
//		model.addAttribute("reList", reList);
////		model.addAttribute("reList", ms.reserveTimeList(meetingroomNo, date));
//		
//		log.info("예약 시간들 정보 : {}", reList);
		
		return "meetingroom/reserve";
	}
	
	@PostMapping("check")
	@ResponseBody
	public String checkTime(@RequestParam(value = "meetingroomNo", required=false) String meetingroomNo, @RequestParam(value = "date", required=false) String date
			,@RequestParam(value = "startTime", required=false) String startTime) {
		String result = null;
		
		int flag = ms.checkTime(meetingroomNo, date, startTime);
		
		if (flag == 1) {
			result = "Y";
		}else if (flag != 1) {
			result = "N";
		}
		
		return result;
	}
	
	@PostMapping("reserve")
	@ResponseBody
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
        
        String status = null;
        
        int checkReserve = ms.checkReserve(mrv);

//        int result;
        
        if (checkReserve != 1) {
        	int result = ms.addReserve(mrv);
        	
        	if (result == 1) {
        		int add = ms.addReserveInfoToCalendar(mrv);
        	}
        	
        	status = "Y";
        	
		}else {
			status = "N";
		}
        
        
		
		return status;
	}
	
	
	
	
//	@GetMapping("reserve/time")
//	public String timeList(Model model, @RequestParam String voNo) {
//		List<MeetingroomVo> timeList = ms.reserveTime(voNo);
//		model.addAttribute("timeList", timeList);
//		
//		return "meetingroom/reserve";
//	}
	
//	@GetMapping("/time")
//	@ResponseBody
//    public List<Map<String, Object>> getReservedTimes(Model model , @RequestParam(value = "meetingroomNo", required=false) String meetingroomNo, @RequestParam(value = "date", required=false) String date) {
//		List<Map<String, Object>> reservedTimes = ms.getReservedTimes(meetingroomNo, date);
////        model.addAttribute("reservedTimes", reservedTimes);
////        
//        log.info("회의실 예약 배열 : {}", reservedTimes);
////        
////        HashMap<String, String> saveResult = new HashMap<>();
////        for (int i = 0; i < reservedTimes.size(); i++) {
////        	saveResult.put("startTime", reservedTimes.get(i).);
////		}
//        
//        return new ResponseEntity<>(reservedTimes, HttpStatus.OK);
//    }


	
//	@GetMapping("time")
//	@ResponseBody
//	public List<Map<String, Object>> time(@RequestParam(value = "meetingroomNo", required=false) String meetingroomNo, @RequestParam(value = "date", required=false) String date){
//
//		
//		List<Map<String, Object>> timeList = ms.reserveTime(meetingroomNo, date);
//		
//		JSONObject jsonObj = new JSONObject();
//		JSONArray jsonArr = new JSONArray();
//		
//		HashMap<String, Object> hash = new HashMap<>();
//		
//		for (int i = 0; i < timeList.size(); i++) {
//			hash.put("start", timeList.get(i).get("START_TIME"));
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
		
		if (result == 1) {
			return "redirect:/meetingroom/reserve";
		}
		
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
	
	//정지하기 (화면)
	@GetMapping("reserve/stop")
	public String mtStop() {
		return "meetingroom/reserve";
	}
	
	//정지하기 (화면)
	@GetMapping("reserve/normal")
	public String mtNormal() {
		return "meetingroom/reserve";
	}
	
	
	
	//삭제하기
	@PostMapping("reserve/delete")
	public String mtDelete(@RequestParam String no) {
		
		int result = ms.mtDelete(no);
		
		return "meetingroom/reserve";
	}
	
	//정지하기
	@PostMapping("reserve/stop")
	public String mtStop(@RequestParam String no) {
		
		int result = ms.mtStop(no);
		
		return "meetingroom/reserve";
	}
	
	//정지 취소하기
	@PostMapping("reserve/normal")
	public String mtNormal(@RequestParam String no) {
		
		int result = ms.mtNormal(no);
		
		return "meetingroom/reserve";
	}
	
	//회의실 예약 조회 (화면)
		
		
	//회의실 예약 조회

}
