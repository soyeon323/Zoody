package com.kh.zoody.document.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.document.vo.DocumentVo;
import com.kh.zoody.page.vo.PageVo;

public interface DocumentDao {

	int uploadFile(SqlSessionTemplate sst, DocumentVo vo);

	List<DocumentVo> getDocumentList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap);

	int getDocumentListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);

	List<DocumentVo> getNewDocument(SqlSessionTemplate sst);

	List<DocumentVo> getLoginMemberDirectory(SqlSessionTemplate sst, int loginMemberNo);

	int newDirctory(SqlSessionTemplate sst, DocumentVo vo);
	
	DocumentVo getNewDirctoryInfo(SqlSessionTemplate sst, DocumentVo vo);
	
}
