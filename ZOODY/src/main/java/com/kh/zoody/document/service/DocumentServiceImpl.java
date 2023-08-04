package com.kh.zoody.document.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.document.dao.DocumentDao;
import com.kh.zoody.document.vo.DocumentVo;

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
	public int uploadFile(DocumentVo vo) {
		log.info("service call");
		return dao.uploadFile(sst,vo);
	}

	@Override
	public List<DocumentVo> getDocumentList() {
		return dao.getDocumentList(sst);
	}

}
