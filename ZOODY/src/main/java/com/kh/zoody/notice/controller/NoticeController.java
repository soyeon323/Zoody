package com.kh.zoody.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {

	//공지사항목록 화면
	@GetMapping("list")
	public void notice() {}
	
	//공지사항 상세조회
	@RequestMapping("detail")
	public String detail() {
		return "notice/detail";
	}

}
