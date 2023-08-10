package com.kh.zoody.document.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.document.vo.DocumentVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class DocumentDaoImpl implements DocumentDao{

	@Override
	public int uploadFile(SqlSessionTemplate sst, DocumentVo vo) {
		log.info(vo.getScope()+"");
		return sst.insert("document.upload", vo);
	}
	
	public List<DocumentVo> getDocumentList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
	    RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
	    return sst.selectList("document.getDocumentList", searchMap, rb);
	}


	@Override
	public int getDocumentListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("document.getDocumenListCnt", searchMap);
	}

	@Override
	public DocumentVo getNewDocument(SqlSessionTemplate sst, DocumentVo vo) {
		return sst.selectOne("document.getNewDocument", vo);
	}
	
	@Override
	public List<DocumentVo> getLoginMemberDirectory(SqlSessionTemplate sst , int loginMemberNo) {
		return sst.selectList("document.getLoginMemberDirectory", loginMemberNo);
	}

	@Override
	public int newDirctory(SqlSessionTemplate sst, DocumentVo vo) {
		return sst.insert("document.newDirctory", vo);
	}

	@Override
	public DocumentVo getNewDirctoryInfo(SqlSessionTemplate sst, DocumentVo vo) {
		return sst.selectOne("document.getNewDirctoryInfo" , vo);
	}

	@Override
	public DocumentVo getDetail(SqlSessionTemplate sst, DocumentVo vo) {
		return sst.selectOne("document.getDetail", vo);
	}
	
	
}
