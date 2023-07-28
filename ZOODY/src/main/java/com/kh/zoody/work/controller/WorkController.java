package com.kh.zoody.work.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zoody.work.service.WorkService;
import com.kh.zoody.work.vo.WorkVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("work")
@RequiredArgsConstructor
@Slf4j
public class WorkController {

	private final WorkService ws;
	
	//업무할당 화면
	@GetMapping("work")
	public String work() {
		return "work/work";
	}
	
//	업무 추가 버튼을 눌러서 업무명 , 업무내용 , 마감날짜 추가
	@GetMapping("insert")
	public int workInsert(@RequestParam Map ParamMap) {
		
		int result = ws.workInsert(ParamMap);
		if(result != 1) {
			throw new RuntimeException();
		}
		return result;
	}
	
	 //업무명과 마감일시 가져오기 AJAX로
//	@PostMapping("work")
//	@ResponseBody
//	public String  getWorkNameAndDate() {
//		
//		WorkVo wv = ws.getWorkNameAndDate();
//		
//		log.info("WorkVo = {}",wv);
//		return wv.toString();
//	}
	
}
