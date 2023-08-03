package com.kh.zoody.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	//공지사항 목록
	@Override
	public List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("notice.list", searchMap, rb);
	}

	//공지사항 게시글 갯수 조회
	@Override
	public int getNoticeListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("notice.getNoticeListCnt", searchMap);
	}

	//게시글 복사
	@Override
	public int copy(SqlSessionTemplate sst, List<String> noList) {
		return sst.insert("notice.insertCopy", noList);
	}

	//게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, List<String> noList) {
		return sst.delete("notice.delete", noList);
	}

	//게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("notice.edit", vo);
	}

	//조회수 증가
	@Override
	public void increaseHit(SqlSessionTemplate sst, String no) {
		sst.update("notice.increaseHit", no);
	}
	
	//공지사항 상세조회
	@Override
	public NoticeVo noticeDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.detail", no);
	}

	//게시글 수정 화면
	@Override
	public NoticeVo selectEdit(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.selectEdit", no);
	}

	//게시글 작성
	@Override
	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.write", vo);
	}

	//댓글 작성
	@Override
	public int reply(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.insert("notice.reply", vo);
	}

	//댓글 조회
	@Override
	public List<ReplyVo> selectReply(SqlSessionTemplate sst, String no) {
		return sst.selectList("notice.selectReply", no);
	}

	//댓글 삭제
	@Override
	public int replyDelete(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.update("notice.replyDelete", vo);
	}

	//댓글 갯수 조회
	@Override
	public int replyCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.replyCnt", no);
	}

	//전체 목록 댓글 갯수 조회
	@Override
	public List<Integer> replyCntAll(SqlSessionTemplate sst, List<String> voListNo) {
		return sst.selectList("notice.replyCntAll", voListNo);
	}

	//건의사항 목록 갯수
	@Override
	public int getSuggestionListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("suggestion.getSuggestionListCnt", searchMap);
	}

	//건의사항 목록
	@Override
	public List<NoticeVo> suggstionList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("suggestion.suggstionList", searchMap, rb);
	}

	//건의사항 복사
	@Override
	public int suggestionCopy(SqlSessionTemplate sst, List<String> noList) {
		return sst.insert("suggestion.suggestionCopy", noList);
	}

	//건의사항 삭제
	@Override
	public int suggestionDelete(SqlSessionTemplate sst, List<String> noList) {
		return sst.update("suggestion.suggestionDelete", noList);
	}

	//공지로 등록
	@Override
	public int noticeEnroll(SqlSessionTemplate sst, List<String> noList) {
		return sst.insert("suggestion.noticeEnroll", noList);
	}

	//건의사항 상세조회
	@Override
	public SuggestionVo suggestionDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("suggestion.suggestionDetail", no);
	}

	//건의사항 상세조회시 조회수 증가
	@Override
	public int suggestionIncreaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("suggestion.suggestionIncreaseHit", no);
	}

	//건의사항 댓글달기
	@Override
	public int suggestionReply(SqlSessionTemplate sst, ReplyVo vo) {
		return sst.insert("suggestion.suggestionReply", vo);
	}

	//건의사항 댓글 화면 보여주기
	@Override
	public List<ReplyVo> selectSuggestionReply(SqlSessionTemplate sst, String no) {
		return sst.selectList("suggestion.selectSuggestionReply", no);
	}

	//건의사항 댓글 수
	@Override
	public int suggestionReplyCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("suggestion.suggestionReplyCnt", no);
	}

	//건의사항 댓글 삭제
	@Override
	public int suggestionReplyDelete(SqlSessionTemplate sst, Map<String, String> replyMap) {
		return sst.update("suggestion.suggestionReplyDelete", replyMap);
	}

}
