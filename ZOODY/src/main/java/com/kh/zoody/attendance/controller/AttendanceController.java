package com.kh.zoody.attendance.controller;

import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.zoody.attendance.service.AttendanceService;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.ExtraWorkVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {
	
	private final AttendanceService attService;
	
	private void addCurrentTypeAttributes(Model model, String userNo) {
	    int currentTypeOne = attService.getCurrentTypeOneCnt(userNo);
	    int currentTypeSix = attService.getCurrentTypeSixCnt(userNo);
	    int currentTypeLeave = attService.getCurrentTypeLeaveCnt(userNo);
	    int currentTypeFour = attService.getCurrentTypeFourCnt(userNo);

	    model.addAttribute("currentTypeOne", currentTypeOne);
	    model.addAttribute("currentTypeSix", currentTypeSix);
	    model.addAttribute("currentTypeLeave", currentTypeLeave);
	    model.addAttribute("currentTypeFour", currentTypeFour);
	    
	    int totalCount = currentTypeOne + currentTypeSix + currentTypeLeave + currentTypeFour;
	    
	    int currentTypeOnePercentage = (int) (((double) currentTypeOne / totalCount) * 100);
	    int currentTypeSixPercentage = (int) (((double) currentTypeSix / totalCount) * 100);
	    int currentTypeLeavePercentage = (int) (((double) currentTypeLeave / totalCount) * 100);
	    int currentTypeFourPercentage = (int) (((double) currentTypeFour / totalCount) * 100);
	    
	    model.addAttribute("currentTypeOnePercentage", currentTypeOnePercentage);
	    model.addAttribute("currentTypeSixPercentage", currentTypeSixPercentage);
	    model.addAttribute("currentTypeLeavePercentage", currentTypeLeavePercentage);
	    model.addAttribute("currentTypeFourPercentage", currentTypeFourPercentage);
	}
	
	//(서브메뉴) 근무현황 메인 화면
	@GetMapping("main")
	public String workStatus(Integer page, Model model, HttpSession session) {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String no = loginMember.getNo();
        String departmentNo = loginMember.getDepartmentNo();
        
//        AttendanceVo vo = new AttendanceVo();
//        vo.setUserNo(no);
		
		//근무 현황 그래프
		int allAttCnt = attService.getUserAttendanceCnt(no);
		model.addAttribute("allAttCnt",allAttCnt);
		
		//휴가,출결,초과근무 목록 조회
		int listCount = attService.getMainAttCnt(no);
		int leaveListCount = attService.getMainLeaveCnt(no);
		
		int currentPage = (page != null) ? page: 1;
		
		PageVo mPv = new PageVo(listCount, currentPage, 2, 3);
		List<AttendanceVo> mainAttList = attService.mainAttlist(mPv, no);
		List<LeaveVo> mainLeList = attService.mainLeList(mPv, no);
		List<ExtraWorkVo> mainWorkList = attService.mainWorkList(mPv, no);
		
		//부서별 목록 조회
		List<AttendanceVo> deList = attService.mainDeList(departmentNo);
		
		model.addAttribute("mainAttList", mainAttList);
		model.addAttribute("mainLeList", mainLeList);
		model.addAttribute("deList", deList);
		model.addAttribute("mainWorkList", mainWorkList);
		model.addAttribute("mPv", mPv);
		
		 addCurrentTypeAttributes(model, no);
		
		
		return "attendance/workStatus";
	}
//	
//	@GetMapping("weekChart")
//	@ResponseBody
//	public List<Integer> countSum(AttendanceVo vo){
//		
//		List<Integer> sumSum = new ArrayList<>();
//		for (int i = 0; i < 22; i+=7) {
//			sumSum.add(0, attService.countSum(vo,i));
//		}
//		
//		return sumSum;
//	}

	//출결 달력 json으로 정보 넘기기
	@GetMapping("monthList")
	@ResponseBody
	public List<Map<String, Object>> monthList(HttpSession session, Model model){
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String no = loginMember.getNo();
		
		List<Map<String, Object>> attMonth = attService.monthList(no);
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		for (int i = 0; i < attMonth.size(); i++) {
			Map<String, Object> attendance = attMonth.get(i);
	        String enrollDate = (String) attendance.get("ENROLLDATE");
	        String checkInTime = (String) attendance.get("CHECK_IN_TIME");
	        String checkOutTime = (String) attendance.get("CHECK_OUT_TIME");
	        
	        JSONObject jsonObject = new JSONObject();
	        jsonObject.put("title", attendance.get("TYPE"));
	        jsonObject.put("start", enrollDate + "T" + checkInTime);
	        jsonObject.put("end", enrollDate + "T" + checkOutTime);
	        
	        jsonArr.add(jsonObject);
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	}
	
	//메인화면 출퇴근 등록
	@PostMapping("main")
	public ResponseEntity<String> workStatus(@RequestParam String action, HttpSession session, Model model) {
	    try {
	    	
//	    	log.info("@@@@@@@@@@ : " + action);
	    	
	    	
	    	UserVo loginMember = (UserVo) session.getAttribute("loginMember");
	        model.addAttribute("loginMember", loginMember);
	        
	        String no = loginMember.getNo();
	    	
	        AttendanceVo attendanceVo = new AttendanceVo();
	        attendanceVo.setLoginMemberNo(no);

	        if ("check-in".equals(action)) {
	            if (attService.hasCheckInRecordToday(attendanceVo)) {
	                return ResponseEntity.ok("already-checked-in");
	            } else {
	                attService.checkInWork(attendanceVo);
	                return ResponseEntity.ok("출근 완료");
	            }
	        } else if ("check-out".equals(action)) {
	            if (attService.hasCheckOutRecordToday(attendanceVo)) {
	                return ResponseEntity.ok("already-checked-out");
	            } else {
	                attService.checkOutWork(attendanceVo);
	                return ResponseEntity.ok("퇴근 완료");
	            }
	        } else {
	            return ResponseEntity.badRequest().body("올바르지 않은 요청");
	        }
	    } catch (Exception e) {
	    	log.error("eeeee : {}" , e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("오류 발생");
	    }
	}
	
	//메인화면 주간 차트
	
	
	//(서브메뉴) 근무현황 목록 조회
	@GetMapping("list")
	public String list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "1") int lp,@RequestParam(defaultValue = "1") int wp, Model model, String searchValue, HttpSession session) {

		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);
        
        String no = loginMember.getNo();
		
	    int listCount = attService.getMyAttendanceCnt(searchValue, no); //여기랑
	    int leaveListCount = attService.getLeaveCnt(no);
	    int workListCount = attService.getWorkCnt(no);
	    int currentPage = page;
//	    int pageLimit = 5;
//	    int boardLimit = 10;
	    
	    //내 출결 조회
	    PageVo pv = new PageVo(listCount, currentPage, 5, 10);
	    List<AttendanceVo> attVoList = attService.list(pv, searchValue, no); //여기 처리
	    model.addAttribute("attVoList", attVoList);
	    model.addAttribute("searchValue", searchValue);
	    
	    //휴가 요청 조회
	    PageVo leavePv = new PageVo(leaveListCount, lp, 2, 4);
	    List<LeaveVo> leVoList = attService.leaveList(leavePv, no);
	    model.addAttribute("leVoList", leVoList);
	    
	    //초과근무 요청 조회
	    PageVo workPv = new PageVo(workListCount, wp, 2, 4);
	    List<ExtraWorkVo> ewList = attService.extraWorkList(workPv, no);
	    model.addAttribute("ewList", ewList);
	    
//	    //출근 타입 카운팅
//	    int currentTypeOne = attService.getCurrentTypeOneCnt(no);
//	    int currentTypeSix = attService.getCurrentTypeSixCnt(no);
//	    int currentTypeLeave = attService.getCurrentTypeLeaveCnt(no);
//	    int currentTypeFour = attService.getCurrentTypeFourCnt(no); 
//	    
//	    model.addAttribute("currentTypeOne", currentTypeOne);
//	    model.addAttribute("currentTypeSix", currentTypeSix);
//	    model.addAttribute("currentTypeLeave", currentTypeLeave);
//	    model.addAttribute("currentTypeFour", currentTypeFour);
	    
	    addCurrentTypeAttributes(model, no);
	    
	    model.addAttribute("pv", pv);
	    model.addAttribute("leavePv", leavePv);
	    model.addAttribute("workPv", workPv);

	    return "attendance/list";
	}
	
//	@GetMapping("day")
//	@ResponseBody
//	public List<Map<String, Object>> chart(Model model, HttpSession session){
//		
//		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
//        model.addAttribute("loginMember", loginMember);
//        
//        String no = loginMember.getNo();
//        
//////		차트 생성
////		Calendar cal = Calendar.getInstance();
////        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
////        Date startDate = cal.getTime();
////        cal.add(Calendar.DATE, 4);
////        Date endDate = cal.getTime();
////        
////        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
////        String formattedStartDate = sdf.format(startDate);
////        String formattedEndDate = sdf.format(endDate);
//////        
////        log.info("시작 : {} / 종료 : {}", formattedStartDate, formattedEndDate);
////
////        
////        List<AttendanceVo> chartList = attService.chartList(no, formattedStartDate, formattedEndDate);
////        model.addAttribute("chartList", chartList);
////        
////        log.info("chartList : {}",chartList);
//		
//		List<Map<String, Object>> dataChart = attService.dataChart(no);
//		
//		JSONObject jsonObj = new JSONObject();
//		JSONArray jsonArr = new JSONArray();
//		
//		HashMap<String, Object> hash = new HashMap<>();
//		
//		for (int i = 0; i < dataChart.size(); i++) {
//			
//			hash.put("labels", dataChart.get(i).get("ENROLLDATE"));
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
	
	@PostMapping("list")
	public String list(@RequestParam Map<String, String> params) {

	        int result = attService.submitOjection(params);

	        return "attendance/list";

	}
	
	//(관리자권한) 유저 전체 근무 조회
	@GetMapping("admin/allList")
	public String objection(Integer page, Model model, @RequestParam Map<String, String> paramMap) {
		
		int listCount = attService.getAllAttendanceCnt(paramMap);
		int currentPage = (page != null) ? page: 1;
		
		PageVo allPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> attAllVoList = attService.allList(allPv, paramMap);
		
		model.addAttribute("attAllVoList", attAllVoList);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("allPv", allPv);
		
		//이의신청 건수 카운팅
		int objectionCnt = getObjectionCnt();
		model.addAttribute("objectionCnt", objectionCnt);
		
		return "attendance/allList";
	}
	
	@GetMapping("admin/objection")
	public String adminObjection(Integer page, Model model, @RequestParam Map<String, String> paramMap){
		
		int listCount = attService.getObjCnt(paramMap);
		int currentPage = (page != null) ? page: 1;
		
		PageVo objPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> objVoList = attService.objList(objPv, paramMap);
		
		model.addAttribute("objVoList", objVoList);
		model.addAttribute("paramMap", paramMap);
		model.addAttribute("objPv", objPv);
		
		int objectionCnt = getObjectionCnt();
		model.addAttribute("objectionCnt", objectionCnt);
		
		return "attendance/adminObjection";
	}
	
	//이의신청 건수 카운팅
	public int getObjectionCnt() {
	    return attService.getObjectionCnt();
	}
	
	@PostMapping("admin/objection")
	public String adminObjection(@RequestParam Map<String, String> objParams) {
		
		int updateStatus = attService.updateStatus(objParams);
		
		return "attendance/adminObjection";
	}

}
