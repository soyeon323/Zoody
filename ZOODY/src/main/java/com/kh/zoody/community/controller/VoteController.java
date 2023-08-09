package com.kh.zoody.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.community.vo.VoteVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("community/vote")
@Slf4j
public class VoteController {
	
	// 투표 목록
	@GetMapping("/*")
	public String name() {
		return "community/vote/progressVote";
	}
	
	// 투표 생성 화면
	@GetMapping("write")
	public String write() {
		return "community/vote/write";
	}
	
	// 투표 생성
	@PostMapping("write")
	public String write(VoteVo vo) {
		
		
		
		return "redrict:/community/progressVote";
	}
	
	// 투표 상세
	
	// 투표 수정 화면
	
	// 투표 수정
	
	// 투표 삭제
	
}
