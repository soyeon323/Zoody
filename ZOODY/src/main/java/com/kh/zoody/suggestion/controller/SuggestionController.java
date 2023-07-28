package com.kh.zoody.suggestion.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.service.SuggestionService;
import com.kh.zoody.suggestion.vo.SuggestionVo;

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
	@PostMapping("write")
	public String write(SuggestionVo vo, @RequestParam(value = "f", required = false) List<MultipartFile> fList, HttpServletRequest req) throws Exception {
		MultipartFile firstFile = fList.get(0);
		String fileName = null;
		String extension = "";
		  // 파일 첨부가 있을 때만 처리
	    if (!firstFile.isEmpty()) {
	        for (MultipartFile f : fList) {
	            String savePath = req.getServletContext().getRealPath("/resources/img/suggestion/");
	            String originalFilename = f.getOriginalFilename();
	            if (originalFilename != null && originalFilename.contains(".")) {
	                extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            }
	            fileName = UUID.randomUUID().toString() + extension;
	            String path = savePath + fileName;
	            File target = new File(path);
	            f.transferTo(target);
	            break;
	        }
	        vo.setChangeName(fileName);
	    }
		int result = ss.write(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/suggestion/list";
	}
	
	//건의사항 수정 화면
	@GetMapping("edit")
	public void edit() {}
	
	//건의사항 수정
	
	//건의사항 상세조회
	@GetMapping("detail")
	public void detail(String no, Model model) {
		SuggestionVo vo = ss.suggestionDetail(no);
		
		List<ReplyVo> voList = ss.selectSuggestionReply(no);
		int replyCnt = ss.suggestionReplyCnt(no);
		
		if(vo == null) {
			throw new RuntimeException();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);
		map.put("voList", voList);
		map.put("replyCnt", replyCnt);
		
		model.addAttribute("map", map);
	}
	
	//건의사항 댓글 달기
	@PostMapping("detail")
	public String suggestionReply(ReplyVo vo) {
		log.info("vo : {}", vo);
		int result = ss.suggestionReply(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		
		return "redirect:/suggestion/detail?no=" + vo.getSuggestionNo();
	}
	
	//건의사항 댓글 삭제
	@PostMapping("replyDelete")
	public String suggestionReplyDelete(@RequestParam Map<String, String> replyMap) {
		int result = ss.suggestionReplyDelete(replyMap);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "";
	}
	
	//건의사항 복사
	@PostMapping("copy")
	public void copy(String no) {
		int result = ss.copy(no);
		
		if(result != 1) {
			throw new RuntimeException();
		}
	}
	
	//건의사항 삭제
	@PostMapping("delete")
	public void delete(String no) {
		int result = ss.delete(no);
		
		if(result != 1) {
			throw new RuntimeException();
		}
	}
}
