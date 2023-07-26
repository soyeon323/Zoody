package com.kh.zoody.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.notice.service.NoticeService;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("notice")
@RequiredArgsConstructor
public class NoticeController {
	private final NoticeService ns;

	//공지사항목록 화면
	@GetMapping("list")
	public String notice(Model model, @RequestParam(defaultValue = "1") Integer page, @RequestParam Map<String, String> searchMap) {
		int listCount = ns.getNoticeListCnt(searchMap);
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = ConstPool.BOARD_LIMIT;
	
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int noticeListCnt = ns.getNoticeListCnt(searchMap);
		List<NoticeVo> voList = ns.list(pv, searchMap);
		
		if(voList == null) {
			throw new RuntimeException();
		}

		HashMap<String, Object> map = new HashMap<>();
		map.put("pv", pv);
		map.put("voList", voList);
		map.put("noticeListCnt", noticeListCnt);
		map.put("searchMap", searchMap);
		
		model.addAttribute("map", map);
		
		return "notice/list";
	}
	
	//공지사항 상세조회
	@GetMapping("detail")
	public void detail(String no, Model model) {
		NoticeVo vo = ns.noticeDetail(no);
		List<ReplyVo> voList = ns.selectReply(no);
		int replyCnt = ns.replyCnt(no);
		
		if(vo == null || voList == null) {
			throw new RuntimeException();
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("voList", voList);
		model.addAttribute("replyCnt", replyCnt);
		
		return;
	}
	
	//공지사항 댓글달기
	@PostMapping("detail")
	public String noticeReply(ReplyVo vo) {
		int result = ns.reply(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		
		return "redirect:/notice/detail?no=" + vo.getNoticeNo();
	}
	
	//댓글 삭제
	@PostMapping("replyDelete")
	public String replyDelete(ReplyVo vo) {
		int result = ns.replyDelete(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "";
	}

}
