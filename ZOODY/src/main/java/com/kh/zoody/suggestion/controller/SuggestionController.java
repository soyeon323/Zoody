package com.kh.zoody.suggestion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("suggestion")
public class SuggestionController {

	//건의사항 목록 화면
	@GetMapping("list")
	public void list() {}
	
	//건의사항 작성 화면
	@GetMapping("write")
	public void write() {}
	
	//건의사항 작성
	
	//건의사항 수정 화면
	@GetMapping("edit")
	public void edit() {}
	
	//건의사항 수정
	
	//건의사항 상세조회
	@RequestMapping("detail")
	public String detail() {
		return "suggestion/detail";
	}
}
