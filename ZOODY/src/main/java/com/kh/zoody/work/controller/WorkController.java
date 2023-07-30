package com.kh.zoody.work.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zoody.user.vo.UserVo;
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
	
	//업무할당 화면  회원들 가져와서 뿌려줘야함
	@GetMapping("work")
	public String work(Model m) {
		
		List<WorkVo> vo = ws.getUserList();
		log.info("vo : {}",vo);
		if(vo ==null) {
			throw new RuntimeException();
		}
		m.addAttribute("vo",vo);
		
		return "work/work";
	}
	
//	업무 추가 버튼을 눌러서 업무명 , 업무내용 , 마감날짜 추가  AJAX 
	@PostMapping("insert")
	public String workInsert(WorkVo vo) {
		
		int result = ws.workInsert(vo);
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/work/work";
	}
	
	 //업무명과 마감일시 가져오기 AJAX로
	@PostMapping("work/view")
	public String  getWorkNameAndDate(Model m) {
		
		WorkVo wv = ws.getWorkNameAndDate();
		
		log.info("WorkVo = {}",wv);
		
		m.addAttribute("wv",wv);
		return "work/work";
	}
	
}
