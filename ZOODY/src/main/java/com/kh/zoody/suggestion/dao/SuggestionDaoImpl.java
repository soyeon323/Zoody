package com.kh.zoody.suggestion.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

@Repository
public class SuggestionDaoImpl implements SuggestionDao{

	//건의사항 목록 갯수
	@Override
	public int getSuggestionListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("suggestion.getSuggestionListCnt", searchMap);
	}

	//건의사항 목록
	@Override
	public List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("suggestion.suggstionList", searchMap, rb);
	}

}
