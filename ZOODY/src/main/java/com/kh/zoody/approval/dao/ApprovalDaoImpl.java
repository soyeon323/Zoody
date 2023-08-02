package com.kh.zoody.approval.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {

	@Override
	public String getDocumentForm(String category, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("approval.getDocumentForm", category);
	}

}
