package com.kh.zoody.document.service;

import java.util.List;

import com.kh.zoody.document.vo.DocumentVo;

public interface DocumentService {

	int uploadFile(DocumentVo vo);

	List<DocumentVo> getDocumentList();
	
	
	
}
