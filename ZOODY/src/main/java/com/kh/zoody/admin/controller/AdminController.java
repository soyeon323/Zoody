package com.kh.zoody.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminController {

	//공지사항 작성 화면
	@GetMapping("notice/write")
	public String noticeWrite() {
		return "admin/notice/write";
	}
	
	//공지사항 작성
}
