package com.kh.zoody.document.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.document.vo.DocumentVo;

@Repository
public class DocumentDaoImpl implements DocumentDao{

	@Override
	public int uploadFile(SqlSessionTemplate sst, DocumentVo vo) {
		return sst.insert("document.upload", vo);
	}

	@Override
	public List<DocumentVo> getDocumentList(SqlSessionTemplate sst) {
		return sst.selectList("document.getDocumentList");
	}
	
	
	
}
