package com.kh.zoody.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

public interface AdminDao {

	//공지사항 목록
	List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap);

	//공지사항 게시글 갯수 조회
	int getNoticeListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);

	//게시글 복사
	int copy(SqlSessionTemplate sst, List<String> noList);

	//게시글 삭제
	int delete(SqlSessionTemplate sst, List<String> noList);

	//공지사항 상세조회
	NoticeVo noticeDetail(SqlSessionTemplate sst, String no);
	
	//게시글 수정
	int edit(SqlSessionTemplate sst, NoticeVo vo);

	//조회수 증가
	void increaseHit(SqlSessionTemplate sst, String no);

	//게시글 수정 화면
	NoticeVo selectEdit(SqlSessionTemplate sst, String no);

	//게시글 작성
	int write(SqlSessionTemplate sst, NoticeVo vo);

	//댓글 작성
	int reply(SqlSessionTemplate sst, ReplyVo vo);

	//댓글 조회
	List<ReplyVo> selectReply(SqlSessionTemplate sst, String no);

	//댓글 삭제
	int replyDelete(SqlSessionTemplate sst, ReplyVo vo);

	//댓글 갯수 조회
	int replyCnt(SqlSessionTemplate sst, String no);

	//전체 목록 댓글 갯수 조회
	List<Integer> replyCntAll(SqlSessionTemplate sst, List<String> voListNo);

	//건의사항 목록 갯수
	int getSuggestionListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);

	//건의사항 목록
	List<NoticeVo> suggstionList(SqlSessionTemplate sst, Map<String, String> searchMap);

	//건의사항 복사
	int suggestionCopy(SqlSessionTemplate sst, List<String> noList);

	//건의사항 삭제
	int suggestionDelete(SqlSessionTemplate sst, List<String> noList);

	//공지사항으로 등록
	int noticeEnroll(SqlSessionTemplate sst, List<String> noList);

	//건의사항 상세조회
	SuggestionVo suggestionDetail(SqlSessionTemplate sst, String no);

	//건의사항 상세조회시 조회수 증가
	int suggestionIncreaseHit(SqlSessionTemplate sst, String no);

	//건의사항 댓글달기
	int suggestionReply(SqlSessionTemplate sst, ReplyVo vo);

	//건의사항 댓글 화면 보여주기
	List<ReplyVo> selectSuggestionReply(SqlSessionTemplate sst, String no);

	//건의사항 댓글 수
	int suggestionReplyCnt(SqlSessionTemplate sst, String no);

	//건의사항 댓글 삭제
	int suggestionReplyDelete(SqlSessionTemplate sst, Map<String, String> replyMap);

}
