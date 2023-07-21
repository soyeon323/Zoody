package com.kh.zoody.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.admin.service.AdminService;
import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {
	private final AdminService as;

	//공지사항 작성 화면
	@GetMapping("notice/write")
	public void noticeWrite() {}
	
	//공지사항 작성
	
	//공지사항 수정 화면
	@GetMapping("notice/edit")
	public void edit() {}
	
	//공지사항 수정
	
	//공지사항 상세조회
	@RequestMapping("notice/detail")
	public void noticeDetail() {}
	
	//공지사항 목록
	@RequestMapping("notice/list")
	public String noticeList(Model model, Integer page) {
		int listCount = as.getNoticeListCnt();
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = ConstPool.BOARD_LIMIT;
		
		log.info("listcount:{}", listCount);
	
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int noticeListCnt = as.getNoticeListCnt();
		
		List<NoticeVo> voList = as.list(pv);
		
		if(voList == null) {
			throw new RuntimeException();
		}

		HashMap<String, Object> map = new HashMap<>();
		map.put("pv", pv);
		map.put("voList", voList);
		map.put("noticeListCnt", noticeListCnt);
		
		model.addAttribute("map", map);
		
		return "admin/notice/list";
	}
	
	//공지사항 복사
	@PostMapping("notice/copy")
	public void copy(String no) {
		log.info("전달된번호 : {}", no);
	}
	
	//건의사항 목록
	@RequestMapping("suggestion/list")
	public void suggestionList() {}
	
	//건의사항 상세조회
	@RequestMapping("suggestion/detail")
	public void suggestionDetail() {}
}
