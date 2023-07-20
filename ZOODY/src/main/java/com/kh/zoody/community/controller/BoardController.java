package com.kh.zoody.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.community.service.CommuityService;
import com.kh.zoody.community.vo.BoardVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("community/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {
	
	private final CommuityService service;
	
	//�옄�쑀 寃뚯떆�뙋 �솕硫�
	@RequestMapping("freeBoard")
	public String freeBoard() {
		return "community/board/freeBoard";
	}
	
	//�씡紐� 寃뚯떆�뙋 �솕硫�
	@RequestMapping("anonymousBoard")
	public String anonymousBoard() {
		return "community/board/anonymousBoard";
	}
	
	@GetMapping("write")
	public String write() {
		return "community/board/write";
	}
	
	@PostMapping("write")
	public String write(BoardVo vo) {
		
		log.info(vo.getCatNo());
		log.info(vo.getContent());
		log.info(vo.getFile());
		log.info(vo.getTitle());
		log.info(vo.getUserNo());
		
		int result =  service.write(vo);
		if (result < 0) {
			return "게시글 작성실패";
		}
		
		return "작성성공";
	}
	
}









