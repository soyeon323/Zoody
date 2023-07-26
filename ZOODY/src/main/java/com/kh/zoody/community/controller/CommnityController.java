package com.kh.zoody.community.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zoody.community.service.CommuityService;
import com.kh.zoody.community.vo.BoardVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("community/board")
@RequiredArgsConstructor
@Slf4j
public class CommnityController {
	
	private final CommuityService service;
	
	//자유게시판
	@RequestMapping("freeBoard")
	public String freeBoard(@RequestParam(defaultValue = "4") int catNo ,Model model) {
		
		List<BoardVo> freeBoardList = service.getBoardList(catNo);
		
		model.addAttribute("freeBoardList", freeBoardList);
		return "community/board/freeBoard";
	}
	
	//전사게시판
	@RequestMapping("anonymousBoard")
	public String anonymousBoard() {
		return "community/board/anonymousBoard";
	}
	
	@GetMapping("write")
	public String write() {
		return "community/board/write";
	}
	
	@PostMapping("write")
	@ResponseBody
	public String write(BoardVo vo) {
		
//		log.info(vo.getCatNo());
		log.info(vo.getContent());
		log.info(vo.getFile());
		log.info(vo.getTitle());
		log.info(vo.getUserNo());
		
		int result =  service.write(vo);
		log.info(result + "zz");
		if (result < 0) {
			return "게시글 작성실패";
		}
		
		return "작성성공";
	}
	
}









