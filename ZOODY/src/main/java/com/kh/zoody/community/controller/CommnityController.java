package com.kh.zoody.community.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.community.service.CommuityService;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.document.vo.DocumentVo;
import com.kh.zoody.home.service.HomeService;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("community/board")
@RequiredArgsConstructor
@Slf4j
public class CommnityController {
	
	private final CommuityService service;
	private final HomeService hs;
	
	//자유게시판
	@RequestMapping("list")
	public String freeBoard(
			Model model,
			HttpServletRequest req, 
			@RequestParam(defaultValue = "1") Integer page, 
			@RequestParam Map<String, String> searchMap, 
			@RequestParam(defaultValue = "3") Integer catNo
			) {
		
		HttpSession session = req.getSession();
		searchMap.put("catNo", String.valueOf(catNo));
		
		int loginMemberNo = 0;
		
		
		
		if (session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
	    }
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        loginMemberNo = Integer.parseInt(loginMember.getNo());
		
		int listCount = service.getBoardListCnt(searchMap);
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = 10;
		
		log.info(catNo+"");
		
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int boardListCnt = service.getBoardListCnt(searchMap);
		List<BoardVo> freeBoardList = service.getBoardList(pv, searchMap);
		List<NoticeVo> getNotice = hs.getNewNotice();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pv", pv);
		map.put("freeBoardList", freeBoardList);
		map.put("boardListCnt", boardListCnt);
		map.put("searchMap", searchMap);
		
		
		model.addAttribute("map", map);
		model.addAttribute("catNo", catNo);
		model.addAttribute("boardListCnt", boardListCnt);
		model.addAttribute("getNotice", getNotice);
		
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
	public String write(BoardVo vo, MultipartFile file) {
		log.info(vo+"");
		int result = service.write(vo);
        if (result < 1) {
            return "게시글 작성실패";
        }
        
        
        
	    try {
	        // 파일 업로드 처리
	        if (!file.isEmpty()) {
	            String originalFilename = file.getOriginalFilename();
	            String uploadedFileName = "your-upload-path/" + originalFilename; // 파일이 업로드될 경로
	            File destFile = new File(uploadedFileName);
	            file.transferTo(destFile);
	            vo.setFile(uploadedFileName);
	        }

	        

	        return "작성성공";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "업로드 또는 처리 과정에서 오류가 발생했습니다.";
	    }
	}

	
	@GetMapping("detail")
	public String getBoardDetail(int no, String loginMemberNo , Model model) {
		
		log.info("호출");
		
		BoardVo boardDetail =  service.getBoardDetail(no);
		
		log.info(boardDetail+"");
		log.info(loginMemberNo+"");
		
		if (boardDetail == null) {
			return "조회실패";
		}
		
		
		
		model.addAttribute("boardDetail", boardDetail);
		
		return "community/board/detail";
	}

}









