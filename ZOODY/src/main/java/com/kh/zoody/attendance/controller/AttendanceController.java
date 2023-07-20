package com.kh.zoody.attendance.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.attendance.service.AttendanceService;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {
	
	private final AttendanceService attService;
	
	//(서브메뉴) 근무현황 화면
	@GetMapping("main")
	public String workStatus() {
		return "attendance/workStatus";
	}
	
	//(서브메뉴) 근무현황 목록 조회
	@GetMapping("list")
	public String attMyList(int page, Model model) {
		
		//내 출결 조회 페이징
		int listCount = attService.getMyAttendanceCnt();
		int currentPage = page;
		
		PageVo myListPv = new PageVo(listCount, currentPage, 5, 10);
		
		List<AttendanceVo> attVoList = attService.attMyList(myListPv);
		
		return "attendance/detail";
	}
	
	//(관리자권한) 유저 전체 근무 조회
	@GetMapping("admin")
	public String objection() {
		return "attendance/objection";
	}
	
	@GetMapping("admin/objection")
	public String adminObjection(){
		return "attendance/adminObjection";
	}

}
