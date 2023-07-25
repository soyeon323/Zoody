package com.kh.zoody.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;

public interface NoticeDao {

	//게시글 갯수 가져오기
	int getNoticeListCnt(SqlSessionTemplate sst);

	//게시글 목록
	List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv);

	//게시글 상세조회
	NoticeVo noticeDetail(SqlSessionTemplate sst, String no);

	//댓글 조회
	List<ReplyVo> selectReply(SqlSessionTemplate sst, String no);

	//댓글 갯수
	int replyCnt(SqlSessionTemplate sst, String no);

	//댓글 달기
	int reply(SqlSessionTemplate sst, ReplyVo vo);

	//댓글 삭제
	int replyDelete(SqlSessionTemplate sst, ReplyVo vo);

	//조회수 증가
	int increaseHit(SqlSessionTemplate sst, String no);

}
