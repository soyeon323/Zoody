package com.kh.zoody.meetingroom.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;


import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

}
