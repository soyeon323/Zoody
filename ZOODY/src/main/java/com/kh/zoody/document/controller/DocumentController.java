package com.kh.zoody.document.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.document.service.DocumentService;
import com.kh.zoody.document.vo.DocumentVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("document")
@RequiredArgsConstructor
@Slf4j
public class DocumentController {
	
	private final DocumentService service;
	
	// 개인 문서 화면
	@GetMapping()
	public String privateDocument(Model model) {
		model.addAttribute("documentType", "private");
		return "document/document";
	}
	
	// 전사 문서 화면
	@GetMapping("enterpriseDocument")
	public String enterpriseDocument(Model model) {
		model.addAttribute("documentType", "enterprise");
		return "document/document";
	}
	
	// 업로드 화면
	@GetMapping("upload")
	public String uploadDocument() {
		return "document/upload";
	}
	
	@PostMapping("upload")
	@ResponseBody
	public String uploadDocument(
					@RequestParam("file") MultipartFile file,
					@RequestParam("loginUserId") String loginUserId,
					Model model,
					HttpServletRequest request
			) {
		if (file.isEmpty()) {
            // 업로드된 파일이 없을 경우 처리
            return "redirect:/document/upload"; // 업로드 폼 페이지로 리다이렉트
        }

		String root = request.getSession().getServletContext().getRealPath("resources"); 
		
        try {
        	
        	log.info(root);
        	log.info(file+"");
        	log.info(loginUserId);
        	
            // 업로드된 파일을 저장할 디렉토리 설정
            String saveFile = root+"\\document\\"+ loginUserId; // 원하는 디렉토리 경로로 변경 가능
        	
            
            log.info(saveFile);
            
            // 디렉토리가 없다면 생성
            File uploadDir = new File(saveFile);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            
            
//            // 파일 저장 경로 설정
            String filePath = saveFile + File.separator + file.getOriginalFilename();
            log.info(filePath);
            
            file.transferTo(new File(filePath));
            
            log.info("dd"+filePath);
            
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String fileNameWithoutExtension = originalFilename.substring(0, originalFilename.lastIndexOf("."));
            log.info("파일 이름: " + fileNameWithoutExtension);
            log.info("확장자: " + fileExtension);
            
            DocumentVo vo = new DocumentVo();
//            vo.setUserNo(loginUserId);
            vo.setUserNo("987");
            vo.setFileName(fileNameWithoutExtension);
            vo.setExtension(fileExtension);
            
            log.info(vo+"");
            
            int result =  service.uploadFile(vo);
            log.info(result+"");
            if (result < 1) {
            	return "uploadFailure";
			}
            
             List<DocumentVo> documentList = service.getDocumentList();
            
//           // 파일 업로드 성공 처리
            return "success"; // 업로드 성공 
        } catch (IOException e) {
//            // 파일 업로드 실패 처리
            return "uploadFailure"; // 업로드 실패 페이지로 리다이렉트/
        }
        
        //폴더 용량
//        public String getFolderSize() {
//            String folderPath = "/path/to/your/folder"; // 대상 폴더 경로를 지정합니다.
//
//            long folderSize = calculateFolderSize(new File(folderPath));
//
//            return "Folder size: " + formatSize(folderSize);
//        }
//
//        private long calculateFolderSize(File folder) {
//            if (folder == null || !folder.exists()) {
//                return 0L;
//            }
//
//            if (!folder.isDirectory()) {
//                return folder.length();
//            }
//
//            long size = 0L;
//            File[] files = folder.listFiles();
//            if (files != null) {
//                for (File file : files) {
//                    size += calculateFolderSize(file);
//                }
//            }
//            return size;
//        }
//
//        private String formatSize(long size) {
//            // 용량을 가독성 좋게 포맷팅하는 메서드 (예: KB, MB, GB)
//            if (size < 1024) {
//                return size + " bytes";
//            } else if (size < 1024 * 1024) {
//                return size / 1024 + " KB";
//            } else if (size < 1024 * 1024 * 1024) {
//                return size / (1024 * 1024) + " MB";
//            } else {
//                return size / (1024 * 1024 * 1024) + " GB";
//            }
//        }
    
	}
	
}
