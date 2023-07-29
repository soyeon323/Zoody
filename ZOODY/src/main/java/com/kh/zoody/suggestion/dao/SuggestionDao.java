package com.kh.zoody.suggestion.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

public interface SuggestionDao {

	//건의사항 목록 갯수
	int getSuggestionListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);

	//건의사항 목록
	List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap);

	//건의사항 상세조회 조회수 증가
	void increaseHit(SqlSessionTemplate sst, String no);

	//건의사항 상세조회
	SuggestionVo suggestionDetail(SqlSessionTemplate sst, String no);

	//건의사항 댓글조회
	List<ReplyVo> selectSuggestionReply(SqlSessionTemplate sst, String no);

	//건의사항 댓글 갯수
	int suggestionReplyCnt(SqlSessionTemplate sst, String no);

	//건의사항 댓글 달기
	int suggestionReply(SqlSessionTemplate sst, ReplyVo vo);

	//건의사항 댓글 삭제
	int suggestionReplyDelete(SqlSessionTemplate sst, Map<String, String> replyMap);

	//건의사항 작성
	int write(SqlSessionTemplate sst, SuggestionVo vo);

	//건의사항 복사
	int copy(SqlSessionTemplate sst, String no);

	//건의사항 삭제
	int delete(SqlSessionTemplate sst, String no);

	//건의사항 수정 화면
	SuggestionVo selectEdit(SqlSessionTemplate sst, String no);

	//건의사항 수정
	int edit(SqlSessionTemplate sst, SuggestionVo vo);

}
