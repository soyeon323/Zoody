package com.kh.zoody.admin.service;

import java.util.List;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;

public interface AdminService {

	//공지사항 목록
	List<NoticeVo> list(PageVo pv);

	//공지사항 게시글 갯수 조회
	int getNoticeListCnt();

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

}
