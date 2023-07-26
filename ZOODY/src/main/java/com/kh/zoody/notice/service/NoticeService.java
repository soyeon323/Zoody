package com.kh.zoody.notice.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;

public interface NoticeService {

	//게시글 갯수 가져오기
	int getNoticeListCnt(Map<String, String> searchMap);

	//게시글 목록
	List<NoticeVo> list(PageVo pv, Map<String, String> searchMap);

	//게시글 상세조회
	NoticeVo noticeDetail(String no);

	//댓글 조회
	List<ReplyVo> selectReply(String no);

	//댓글 갯수 
	int replyCnt(String no);

	//댓글 달기
	int reply(ReplyVo vo);

	//댓글 삭제
	int replyDelete(ReplyVo vo);

}
