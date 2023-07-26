package com.kh.zoody.notice.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zoody.notice.dao.NoticeDao;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	private final NoticeDao dao;
	private final SqlSessionTemplate sst;
	
	//게시글 갯수 가져오기
	@Override
	public int getNoticeListCnt(Map<String, String> searchMap) {
		return dao.getNoticeListCnt(sst, searchMap);
	}

	//게시글 목록
	@Override
	public List<NoticeVo> list(PageVo pv, Map<String, String> searchMap) {
		return dao.list(sst, pv, searchMap);
	}

	//게시글 상세조회
	@Override
	public NoticeVo noticeDetail(String no) {
		dao.increaseHit(sst, no);
		return dao.noticeDetail(sst, no);
	}

	//댓글 조회
	@Override
	public List<ReplyVo> selectReply(String no) {
		return dao.selectReply(sst, no);
	}

	//댓글 갯수
	@Override
	public int replyCnt(String no) {
		return dao.replyCnt(sst, no);
	}

	//댓글 달기
	@Override
	public int reply(ReplyVo vo) {
		return dao.reply(sst, vo);
	}

	//댓글 삭제
	@Override
	public int replyDelete(ReplyVo vo) {
		return dao.replyDelete(sst, vo);
	}

}
