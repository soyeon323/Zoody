package com.kh.zoody.document.controller;

import java.io.File;
import java.io.IOException;
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

import com.google.gson.Gson;
import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.document.service.DocumentService;
import com.kh.zoody.document.vo.DocumentVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("document")
@RequiredArgsConstructor
@Slf4j
public class DocumentController {
	
	private final DocumentService service;
	
	// 개인 문서 화면
	@GetMapping("list")
	public String privateDocument(
			Model model, 
			HttpServletRequest req, 
			@RequestParam(defaultValue = "1") Integer page, 
			@RequestParam Map<String, String> searchMap, 
			@RequestParam(defaultValue = "1") Integer scope
		) {
		
		HttpSession session = req.getSession();
		searchMap.put("scope", String.valueOf(scope));
		
		int loginMemberNo = 0;
		
		if (session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
	    }
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        loginMemberNo = Integer.parseInt(loginMember.getNo());
		
		int listCount = service.getDocumentListCnt(searchMap);
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = 10;
		
		log.info(scope+"");
		
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int documentListCnt = service.getDocumentListCnt(searchMap);
		List<DocumentVo> documentList = service.getDocumentList(pv, searchMap);
        List<DocumentVo> directoryList = service.getLoginMemberDirectory(loginMemberNo);
        log.info(directoryList+"");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pv", pv);
		map.put("documentList", documentList);
		map.put("documentListCnt", documentListCnt);
		map.put("searchMap", searchMap);
		
		
		model.addAttribute("map", map);
		model.addAttribute("documentType", "전사 문서");
		model.addAttribute("directoryList", directoryList);
		
		return "document/list";
	}
	


	@PostMapping(value = "upload",
			produces="application/json;charset=UTF-8")
	public String uploadDocument(
					@RequestParam("file") MultipartFile file,
					DocumentVo vo,
					HttpServletRequest request
			) {
		if (file.isEmpty()) {
            // 업로드된 파일이 없을 경우 처리
            return "redirect:/document/upload"; // 업로드 폼 페이지로 리다이렉트
        }
		
		log.info("VO: "+vo);
		
		
		String root = request.getSession().getServletContext().getRealPath("resources"); 
		
	
        try {
        	
            // 업로드된 파일을 저장할 디렉토리 설정
            String saveFile = root+"\\document\\"+ vo.getUserNo(); // 원하는 디렉토리 경로로 변경 가능
            // root(resources) +  document + loginMemberId + 디렉토리 번호(no)
        	
            
            log.info(saveFile);
            
            // 디렉토리가 없다면 생성
            File uploadDir = new File(saveFile);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            
            
            // 파일 저장 경로 설정
            String filePath = saveFile + File.separator + file.getOriginalFilename();
            
            file.transferTo(new File(filePath));
            
            
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String fileNameWithoutExtension = originalFilename.substring(0, originalFilename.lastIndexOf("."));
            log.info("파일 이름: " + fileNameWithoutExtension);
            log.info("확장자: " + fileExtension);
         
            
            vo.setFileName(fileNameWithoutExtension);
            vo.setExtension(fileNameWithoutExtension);
            
            
            int result =  service.uploadFile(vo);
            log.info(result+"");
            if (result < 1) {
            	return "uploadFailure";
			}
            
             DocumentVo documentList = service.getNewDocument(vo);
            
             Gson gson = new Gson();
             
             String documentListJson = gson.toJson(documentList);
             
            return documentListJson; 
        } catch (IOException e) {
            return "uploadFailure";
        }
        
        
	}
	
	@PostMapping(value="directory", produces="application/json;charset=UTF-8")
	@ResponseBody
    public String newDirctory(DocumentVo vo, HttpServletRequest req , Model model, HttpServletRequest request) {
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
	    }
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        vo.setUserNo(loginMember.getNo());
		
		int result = service.newDirctory(vo);
		if (result < 1) {
			return "error";
		}
		
		log.info(vo+"");
		
		
		DocumentVo newDirctoryInfo = service.getNewDirctoryInfo(vo);
		
		log.info(newDirctoryInfo+"");
		
		if (newDirctoryInfo == null) {
			return "error";
		}
		
		// root(resources) +  document + vo.getUserNo() + "\\" +  vo.getDirectoryNo()
		String root = request.getSession().getServletContext().getRealPath("resources"); 
		String newDirectoryPath = root+"\\document\\"+ vo.getUserNo();  // 원하는 디렉토리 경로로 변경 가능
		String plusPath = "\\"  + newDirctoryInfo.getNo();		
		String path =  newDirectoryPath + plusPath;
		
		log.info(newDirectoryPath);
		
		File buildNewDirectory = new File(path);
		if (!buildNewDirectory.exists()) {
		    if (buildNewDirectory.mkdirs()) {
		        // 디렉토리 생성 성공
		        log.info("디렉토리 생성 성공");
		    } else {
		        // 디렉토리 생성 실패
		        log.info("디렉토리 생성 실패");
		    }
		}
		
		
		Gson gson = new Gson();
		String info = gson.toJson(newDirctoryInfo);
		
		log.info(info);
		
		return info;
		
	}
	
	
	
}















