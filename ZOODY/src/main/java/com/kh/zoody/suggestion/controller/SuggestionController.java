package com.kh.zoody.suggestion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.suggestion.service.SuggestionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("suggestion")
@RequiredArgsConstructor
@Slf4j
public class SuggestionController {
	private final SuggestionService ss;
	
	//건의사항 목록 화면
	@RequestMapping("list")
	public void list(Model model,@RequestParam(defaultValue = "1") Integer page, @RequestParam Map<String, String> searchMap) {
		int listCount = ss.getSuggestionListCnt(searchMap);
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = ConstPool.BOARD_LIMIT;
	
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int suggestionListCnt = ss.getSuggestionListCnt(searchMap);
		List<NoticeVo> voList = ss.list(pv, searchMap);
		
		if(voList == null) {
			throw new RuntimeException();
		}

		HashMap<String, Object> map = new HashMap<>();
		map.put("pv", pv);
		map.put("voList", voList);
		map.put("suggestionListCnt", suggestionListCnt);
		map.put("searchMap", searchMap);
		
		model.addAttribute("map", map);
	}
	
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
