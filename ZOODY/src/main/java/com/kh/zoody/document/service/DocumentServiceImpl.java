package com.kh.zoody.document.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.document.dao.DocumentDao;
import com.kh.zoody.document.vo.DocumentVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class DocumentServiceImpl implements DocumentService {
	
	private final SqlSessionTemplate sst;
	private final DocumentDao dao;
	
	
	@Override
	public int getDocumentListCnt(Map<String, String> searchMap) {
		return dao.getDocumentListCnt(sst, searchMap);
	}
	
	@Override
	public List<DocumentVo> getDocumentList(PageVo pv, Map<String, String> searchMap) {
	    return dao.getDocumentList(sst, pv, searchMap);
	}


	@Override
	public int uploadFile(DocumentVo vo) {
		log.info("service call");
		return dao.uploadFile(sst,vo);
	}

	@Override
	public List<DocumentVo> getNewDocument() {
		return dao.getNewDocument(sst);
	}
	
	@Override
	public List<DocumentVo> getLoginMemberDirectory(int loginMemberNo) {
		return dao.getLoginMemberDirectory(sst, loginMemberNo);
	}

	@Override
	public int newDirctory(DocumentVo vo) {
		return dao.newDirctory(sst, vo);
	}

}
