package com.kh.zoody.suggestion.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.suggestion.dao.SuggestionDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class SuggestionServiceImpl implements SuggestionService{
	private final SuggestionDao dao;
	private final SqlSessionTemplate sst;
	
	//건의사항 목록 갯수
	@Override
	public int getSuggestionListCnt(Map<String, String> searchMap) {
		return dao.getSuggestionListCnt(sst, searchMap);
	}
	
	//건의사항 목록
	@Override
	public List<NoticeVo> list(PageVo pv, Map<String, String> searchMap) {
		return dao.list(sst, pv, searchMap);
	}
}
