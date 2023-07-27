package com.kh.zoody.suggestion.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

public interface SuggestionDao {

	//건의사항 목록 갯수
	int getSuggestionListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);

	//건의사항 목록
	List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap);

}
