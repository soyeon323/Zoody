package com.kh.zoody.document.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.document.vo.DocumentVo;

public interface DocumentDao {

	int uploadFile(SqlSessionTemplate sst, DocumentVo vo);

	List<DocumentVo> getDocumentList(SqlSessionTemplate sst);

}
