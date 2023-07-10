package com.kh.zoody.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("community")
@RequiredArgsConstructor
public class CommunityController {
	
	//게시판 화면
	@RequestMapping("board")
	public String board() {
		return "community/board";
	}
	
}
