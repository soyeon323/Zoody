package com.kh.zoody.admin.controller;

import java.io.File;
import java.util.ArrayList;
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

import com.google.gson.Gson;
import com.kh.zoody.admin.service.AdminService;
import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;

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
	@PostMapping("notice/write")
	public String noticeWrite(NoticeVo vo, @RequestParam(value = "f", required = false) List<MultipartFile> fList, HttpServletRequest req) throws Exception{
		MultipartFile firstFile = fList.get(0);
		String fileName = null;
		String extension = "";
		  // 파일 첨부가 있을 때만 처리
	    if (!firstFile.isEmpty()) {
	        for (MultipartFile f : fList) {
	            String savePath = req.getServletContext().getRealPath("/resources/img/notice/");
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
		int result = as.write(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/admin/notice/list";
	}
	
	//공지사항 수정 화면
	@GetMapping("notice/edit")
	public void edit(String no, Model model) {
		NoticeVo vo = as.selectEdit(no);
		if(vo == null) {
			throw new RuntimeException();
		}
		
		model.addAttribute("vo", vo);
	}
	
	//공지사항 수정
	@PostMapping("notice/edit")
	public String edit(NoticeVo vo,@RequestParam(value = "f", required = false) List<MultipartFile> fList, HttpServletRequest req) throws Exception{
		MultipartFile firstFile = fList.get(0);
		String fileName = null;
		String extension = "";
		  // 파일 첨부가 있을 때만 처리
	    if (!firstFile.isEmpty()) {
	        for (MultipartFile f : fList) {
	            String savePath = req.getServletContext().getRealPath("/resources/img/notice/");
	            String originalFilename = f.getOriginalFilename();
	            if (originalFilename != null && originalFilename.contains(".")) {
	                extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            }
	            fileName = UUID.randomUUID().toString() + extension;
	            String path = savePath + fileName;
	            File target = new File(path);
	            f.transferTo(target);
	        }
	        vo.setChangeName(fileName);
	    } 
		int result = as.edit(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/admin/notice/detail?no=" + vo.getNo();
	}
	
	//공지사항 상세조회
	@GetMapping("notice/detail")
	public void noticeDetail(String no, Model model) {
		NoticeVo vo = as.noticeDetail(no);
		List<ReplyVo> voList = as.selectReply(no);
		int replyCnt = as.replyCnt(no);
		
		if(vo == null || voList == null) {
			throw new RuntimeException();
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("voList", voList);
		model.addAttribute("replyCnt", replyCnt);
		
		return;
	}
	
	//공지사항 댓글달기
	@PostMapping("notice/detail")
	public String noticeReply(ReplyVo vo) {
		int result = as.reply(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		
		return "redirect:/admin/notice/detail?no=" + vo.getNoticeNo();
	}
	
	//공지사항 목록
	@RequestMapping("notice/list")
	public String noticeList(Model model,@RequestParam(defaultValue = "1") Integer page, @RequestParam Map<String, String> searchMap) {
	
		int listCount = as.getNoticeListCnt(searchMap);
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = ConstPool.BOARD_LIMIT;
	
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int noticeListCnt = as.getNoticeListCnt(searchMap);
		List<NoticeVo> voList = as.list(pv, searchMap);
		
		if(voList == null) {
			throw new RuntimeException();
		}

		HashMap<String, Object> map = new HashMap<>();
		map.put("pv", pv);
		map.put("voList", voList);
		map.put("noticeListCnt", noticeListCnt);
		map.put("searchMap", searchMap);
		
		model.addAttribute("map", map);
		
		return "admin/notice/list";
	}
	
	//게시글 복사
	@PostMapping("notice/copy")
	public void noticeCopy(@RequestParam("no") List<String> noList) {
		int result = as.copy(noList);
		
		if(result == 0) {
			throw new RuntimeException();
		}
	}
	
	//게시글 삭제
	@PostMapping("notice/delete")
	public void noticeDelete(@RequestParam("no") List<String> noList) {
		int result = as.delete(noList);
		
		if(result == 0) {
			throw new RuntimeException();
		}
	}
	
	//건의사항 목록
	@RequestMapping("suggestion/list")
	public void suggestionList(Model model,@RequestParam(defaultValue = "1") Integer page, @RequestParam Map<String, String> searchMap) {

		int listCount = as.getSuggestionListCnt(searchMap);
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = ConstPool.BOARD_LIMIT;
	
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int suggestionListCnt = as.getSuggestionListCnt(searchMap);
		List<NoticeVo> voList = as.suggstionList(pv, searchMap);
		
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
	
	//건의사항 상세조회
	@RequestMapping("suggestion/detail")
	public void suggestionDetail() {}
	
	//건의사항 복사
	@PostMapping("suggestion/copy")
	public void suggestionCopy(@RequestParam("no") List<String> noList) {
		int result = as.suggestionCopy(noList);
		
		if(result == 0) {
			throw new RuntimeException();
		}
	}
	
	//건의사항 삭제
	@PostMapping("suggestion/delete")
	public void suggestionDelete(@RequestParam("no") List<String> noList) {
		int result = as.suggestionDelete(noList);
		
		if(result == 0) {
			throw new RuntimeException();
		}
	}
	
	//댓글 삭제
	@PostMapping("notice/replyDelete")
	public String replyDelete(ReplyVo vo) {
		int result = as.replyDelete(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "";
	}
	
}
