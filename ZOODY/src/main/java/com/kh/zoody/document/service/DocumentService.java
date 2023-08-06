package com.kh.zoody.document.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.document.vo.DocumentVo;
import com.kh.zoody.page.vo.PageVo;

public interface DocumentService {

	//파일 갯수 가져오기
	int getDocumentListCnt(Map<String, String> searchMap);
	
	//파일 목록 가져오기
	List<DocumentVo> getDocumentList(PageVo pv, Map<String, String> searchMap);
	
	//파일 업로드
	int uploadFile(DocumentVo vo);

	List<DocumentVo> getNewDocument();
	
	
	
	
	
}
