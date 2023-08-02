package com.kh.zoody.approval.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface ApprovalDao {

	// 결재문서 양식 가져오기
	String getDocumentForm(String category, SqlSessionTemplate sqlSessionTemplate);

}
