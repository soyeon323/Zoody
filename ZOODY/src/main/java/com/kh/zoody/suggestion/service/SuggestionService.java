package com.kh.zoody.suggestion.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

public interface SuggestionService {

	//건의사항 목록 갯수
	int getSuggestionListCnt(Map<String, String> searchMap);

	//건의사항 목록
	List<NoticeVo> list(PageVo pv, Map<String, String> searchMap);

	//건의사항 상세조회
	SuggestionVo suggestionDetail(String no);

	//건의사항 댓글 조회
	List<ReplyVo> selectSuggestionReply(String no);

	//건의사항 댓글 갯수
	int suggestionReplyCnt(String no);

	//건의사항 댓글 달기
	int suggestionReply(ReplyVo vo);

	//건의사항 댓글 삭제
	int suggestionReplyDelete(Map<String, String> replyMap);

	//건의사항 작성
	int write(SuggestionVo vo);

	//건의사항 복사
	int copy(String no);

	//건의사항 삭제
	int delete(String no);

}
