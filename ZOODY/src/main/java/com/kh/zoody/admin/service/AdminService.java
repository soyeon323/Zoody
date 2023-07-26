package com.kh.zoody.admin.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

public interface AdminService {

	//공지사항 목록
	List<NoticeVo> list(PageVo pv, Map<String, String> searchMap);

	//공지사항 게시글 갯수 조회
	int getNoticeListCnt(Map<String, String> searchMap);

	//게시글 복사
	int copy(List<String> noList);

	//게시글 삭제
	int delete(List<String> noList);

	//게시글 상세조회
	NoticeVo noticeDetail(String no);
	
	//게시글 수정
	int edit(NoticeVo vo);

	//게시글 수정 화면
	NoticeVo selectEdit(String no);

	//게시글 작성
	int write(NoticeVo vo);

	//댓글 작성
	int reply(ReplyVo vo);

	//댓글 조회
	List<ReplyVo> selectReply(String no);

	//댓글 삭제
	int replyDelete(ReplyVo vo);

	//댓글 갯수 조회
	int replyCnt(String no);

	//전체목록 댓글 갯수 조회
	List<Integer> replyCntAll(List<String> voListNo);

	//건의사항 목록
	int getSuggestionListCnt(Map<String, String> searchMap);

	//건의사항 목록 갯수
	List<NoticeVo> suggstionList(PageVo pv, Map<String, String> searchMap);

	//건의사항 복사
	int suggestionCopy(List<String> noList);

	//건의사항 삭제
	int suggestionDelete(List<String> noList);

	//공지사항으로 등록
	int noticeEnroll(List<String> noList);

	//건의사항 상세조회
	SuggestionVo suggestionDetail(String no);

}
