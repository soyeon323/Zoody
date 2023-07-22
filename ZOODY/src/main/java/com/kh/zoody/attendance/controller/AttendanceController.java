package com.kh.zoody.attendance.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.attendance.service.AttendanceService;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("attendance")
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {
	
	private final AttendanceService attService;
	
	//(서브메뉴) 근무현황 메인 화면
	@GetMapping("main")
	public String workStatus(Integer page, Model model) {
		
		//휴가,출결,초과근무 목록 조회
		int listCount = attService.getMainAttCnt();
		int leaveListCount = attService.getMainLeaveCnt();
		
		int currentPage = (page != null) ? page: 1;
		
		PageVo mPv = new PageVo(listCount, currentPage, 2, 3);
		List<AttendanceVo> mainAttList = attService.mainAttlist(mPv);
		List<LeaveVo> mainLeList = attService.mainLeList(mPv);
		
		//부서별 목록 조회
		List<AttendanceVo> deList = attService.mainDeList();
		
		model.addAttribute("mainAttList", mainAttList);
		model.addAttribute("mainLeList", mainLeList);
		
		model.addAttribute("deList", deList);
		
		return "attendance/workStatus";
	}
	
	@PostMapping("main")
	public String workStatus(AttendanceVo vo) {
		
		int result = attService.checkInWork(vo);
		
		return "attendance/workStatus";
	}
	
	//(서브메뉴) 근무현황 목록 조회
	@GetMapping("list")
	public String list(Integer page, Model model) {

	    int listCount = attService.getMyAttendanceCnt();
	    int leaveListCount = attService.getLeaveCnt();
	    int currentPage = (page != null) ? page: 1;
//	    int pageLimit = 5;
//	    int boardLimit = 10;

	    //내 출결 조회
	    PageVo pv = new PageVo(listCount, currentPage, 5, 10);
	    List<AttendanceVo> attVoList = attService.list(pv);
	    model.addAttribute("attVoList", attVoList);
	    
	    //휴가 요청 조회
	    PageVo leavePv = new PageVo(leaveListCount, currentPage, 2, 4);
	    List<LeaveVo> leVoList = attService.leaveList(leavePv);
	    model.addAttribute("leVoList", leVoList);

	    return "attendance/list";
	}
	
	//(관리자권한) 유저 전체 근무 조회
	@GetMapping("allList")
	public String objection(Integer page, Model model) {
		
		int listCount = attService.getAllAttendanceCnt();
		int currentPage = (page != null) ? page: 1;
		
		PageVo allPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> attAllVoList = attService.allList(allPv);
		
		model.addAttribute("attAllVoList", attAllVoList);
		
		return "attendance/allList";
	}
	
	@GetMapping("admin/objection")
	public String adminObjection(Integer page, Model model){
		
		int listCount = attService.getObjCnt();
		int currentPage = (page != null) ? page: 1;
		
		PageVo objPv = new PageVo(listCount, currentPage, 5, 10);
		List<AttendanceVo> objVoList = attService.objList(objPv);
		
		model.addAttribute("objVoList", objVoList);
		
		return "attendance/adminObjection";
	}

}
