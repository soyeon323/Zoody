package com.kh.zoody.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("community/board")
@RequiredArgsConstructor
public class BoardController {
	
	//자유 게시판 화면
	@RequestMapping("freeBoard")
	public String freeBoard() {
		return "community/board/freeBoard";
	}
	
	//익명 게시판 화면
	@RequestMapping("anonymousBoard")
	public String anonymousBoard() {
		return "community/board/anonymousBoard";
	}
	
}
