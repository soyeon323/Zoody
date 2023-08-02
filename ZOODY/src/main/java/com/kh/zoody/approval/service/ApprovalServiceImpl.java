package com.kh.zoody.approval.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.approval.dao.ApprovalDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ApprovalServiceImpl implements ApprovalService {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	private final ApprovalDao approvalDao;

	// 결재문서 양식 가져오기
	@Override
	public String getDocumentForm(String category) {
		return approvalDao.getDocumentForm(category, sqlSessionTemplate);
	}

}
