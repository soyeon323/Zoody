package com.kh.zoody.suggestion.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.dao.SuggestionDao;
import com.kh.zoody.suggestion.vo.SuggestionVo;

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

	//건의사항 상세조회
	@Override
	public SuggestionVo suggestionDetail(String no) {
		dao.increaseHit(sst, no);
		return dao.suggestionDetail(sst, no);
	}

	//건의사항 댓글 조회
	@Override
	public List<ReplyVo> selectSuggestionReply(String no) {
		return dao.selectSuggestionReply(sst, no);
	}

	//건의사항 댓글 갯수
	@Override
	public int suggestionReplyCnt(String no) {
		return dao.suggestionReplyCnt(sst, no);
	}

	//건의사항 댓글 달기
	@Override
	public int suggestionReply(ReplyVo vo) {
		return dao.suggestionReply(sst, vo);
	}

	//건의사항 댓글 삭제
	@Override
	public int suggestionReplyDelete(Map<String, String> replyMap) {
		return dao.suggestionReplyDelete(sst, replyMap);
	}

	//건의사항 작성
	@Override
	public int write(SuggestionVo vo) {
		return dao.write(sst, vo);
	}

	//건의사항 복사
	@Override
	public int copy(String no) {
		return dao.copy(sst, no);
	}

	//건의사항 삭제
	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}
}
