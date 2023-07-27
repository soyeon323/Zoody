package com.kh.zoody.suggestion.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

public interface SuggestionService {

	//건의사항 목록 갯수
	int getSuggestionListCnt(Map<String, String> searchMap);

	//건의사항 목록
	List<NoticeVo> list(PageVo pv, Map<String, String> searchMap);

}
