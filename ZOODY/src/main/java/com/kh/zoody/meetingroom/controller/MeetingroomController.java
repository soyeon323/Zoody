package com.kh.zoody.meetingroom.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zoody.meetingroom.service.MeetingroomService;
import com.kh.zoody.meetingroom.vo.MeetingroomVo;

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
	public String reserve(Model model) {
		
		List<MeetingroomVo> list = ms.selectList();
		model.addAttribute("list", list);
		
		return "meetingroom/reserve";
	}
	
	//회의실 추가 (화면)
	@GetMapping("add")
	public String add() {
		return "meetingroom/add";
	}
	
	//회의실 추가
	@PostMapping("add")
	public String add(MeetingroomVo mvo) {
		
		int result = ms.addMeetingroom(mvo);
		
		return "meetingroom/add";
	}
	
	//수정하기 (화면)
	@GetMapping("reserve/update")
	public String mtUpdate(Model model,String no) {
		
		MeetingroomVo detail = ms.selectDetail(no);
		
		model.addAttribute("detail", detail);
		
		System.out.println(detail);
		
		System.out.println(no);
		
		System.out.println(no);
		
		return "meetingroom/update";
	}
	
//	//수정하기
//	@PostMapping("reserve/update")
//	public String mtUpdate(@RequestParam String no) {
//		return "meetingroom/update";
//	}
	
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

}
