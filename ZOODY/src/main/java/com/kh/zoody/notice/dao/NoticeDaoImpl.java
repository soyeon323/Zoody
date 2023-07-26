package com.kh.zoody.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	//게시글 갯수 가져오기
	@Override
	public int getNoticeListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("notice.getNoticeListCnt", searchMap);
	}

	//게시글 목록
	@Override
	public List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("notice.list", searchMap, rb);
	}

	//게시글 상세조회
	@Override
	public NoticeVo noticeDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.detail", no);
	}

	//댓글 조회
	@Override
	public List<ReplyVo> selectReply(SqlSessionTemplate sst, String no) {
		return sst.selectList("notice.selectReply", no);
	}

	//댓글 갯수
	@Override
	public int replyCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.replyCnt", no);
	}

	//댓글 달기
	@Override
	public int reply(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.insert("notice.reply", vo);
	}

	//댓글 삭제
	@Override
	public int replyDelete(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.update("notice.replyDelete", vo);
	}

	//조회수 증가
	@Override
	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("notice.increaseHit", no);
	}

}
