package com.kh.zoody.directory.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.zoody.document.vo.DocumentVo;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;


@RestController
@RequestMapping("directory")
@Slf4j
public class DirectoryController{

	
		@PostMapping("rename")
		public String renameDirectory(
				DocumentVo vo,
				HttpServletRequest request
				) {
			
			
			if (vo.getDirectoryName() == "" || vo.getDirectoryName() == null) {
				return "error";
			}
			
			log.info("새로운 디렉토리 이름 : " + vo);
			log.info("새로운 디렉토리 이름 : " + vo.getDirectoryName());
			
			
			
			String newName = vo.getDirectoryName();
			
			// root(resources) +  document + vo.getUserNo() + "\\" +  vo.getDirectoryNo()
			String root = request.getSession().getServletContext().getRealPath("resources"); 
			String path = root+"\\document\\"+ vo.getUserNo() + "\\" + vo.getDirectoryNo(); 
			
			log.info(path);
			
			try {
	            File folder = new File(path);
	            
	            // 디렉토리가 없다면 생성
	            if (!folder.exists()) {
	            	folder.mkdir();
	            }
	            
	            if (folder.exists() && folder.isDirectory()) {
	                String parentPath = folder.getParent(); // 폴더의 상위 경로
	                File newFolder = new File(parentPath, newName); // 새로운 폴더 객체 생성
	                
	                if (folder.renameTo(newFolder)) {
	                    // 이름 변경 성공
	                    return "redirect:/success-page"; // 성공 페이지로 리다이렉트
	                } else {
	                    // 이름 변경 실패
	                    return "redirect:/error-page"; // 에러 페이지로 리다이렉트
	                }
	            } else {
	                // 폴더가 존재하지 않거나 폴더가 아닌 경우
	                return "redirect:/error-page"; // 에러 페이지로 리다이렉트
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "redirect:/error-page"; // 에러 페이지로 리다이렉트
	        }
					
			
		}
	
//    @GetMapping("/check")
//    public long get폴더용량(@RequestParam("경로") String 경로) {
//        // 주어진 경로로 File 객체 생성
//        File 폴더 = new File(경로);
//
//        // 폴더가 존재하는지 확인하고, 존재하지 않으면 오류 처리
//        if (!폴더.exists() || !폴더.isDirectory()) {
//            throw new IllegalArgumentException("유효한 폴더 경로가 아닙니다.");
//        }
//
//        // 폴더 내 모든 파일과 폴더들의 총 용량 계산
//        long 총용량 = calculateFolderSize(폴더);
//
//        return 총용량;
//    }
//
//    private long calculateFolderSize(File 폴더) {
//        // 폴더 내 모든 파일과 폴더들의 총 용량 계산 변수
//        long 총용량 = 0;
//
//        // 폴더 내의 모든 파일과 폴더들에 대해 반복
//        File[] 파일목록 = 폴더.listFiles();
//        if (파일목록 != null) {
//            for (File 파일 : 파일목록) {
//                // 파일일 경우 용량을 증가
//                if (파일.isFile()) {
//                    총용량 += 파일.length();
//                }
//                // 폴더일 경우 재귀적으로 폴더 내 파일들의 용량 계산
//                else if (파일.isDirectory()) {
//                    총용량 += calculateFolderSize(파일);
//                }
//            }
//        }
//
//        return 총용량;
//    }
}
