package com.kh.zoody.admin.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.admin.dao.AdminDao;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.reply.vo.ReplyVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminServiceImpl implements AdminService{
	private final AdminDao dao;
	private final SqlSessionTemplate sst;
	
	//공지사항 목록
	@Override
	public List<NoticeVo> list(PageVo pv, Map<String, String> searchMap) {
		return dao.list(sst, pv, searchMap);
	}

	//공지사항 게시글 갯수 조회
	@Override
	public int getNoticeListCnt(Map<String, String> searchMap) {
		return dao.getNoticeListCnt(sst, searchMap);
	}

	//게시글 복사
	@Override
	public int copy(List<String> noList) {
		return dao.copy(sst, noList);
	}

	//게시글 삭제
	@Override
	public int delete(List<String> noList) {
		return dao.delete(sst, noList);
	}

	//게시글 상세조회
	@Override
	public NoticeVo noticeDetail(String no) {
		dao.increaseHit(sst, no);
		return dao.noticeDetail(sst, no);
		
	}
	//게시글 수정
	@Override
	public int edit(NoticeVo vo) {
		return dao.edit(sst, vo);
	}

	//게시글 수정 화면
	@Override
	public NoticeVo selectEdit(String no) {
		return dao.selectEdit(sst, no);
	}

	//게시글 작성
	@Override
	public int write(NoticeVo vo) {
		return dao.write(sst, vo);
	}

	//댓글작성
	@Override
	public int reply(ReplyVo vo) {
		return dao.reply(sst, vo);
	}

	//댓글 조회
	@Override
	public List<ReplyVo> selectReply(String no) {
		return dao.selectReply(sst, no);
	}

	//댓글 삭제
	@Override
	public int replyDelete(ReplyVo vo) {
		return dao.replyDelete(sst, vo);
	}

	//댓글 갯수 조회
	@Override
	public int replyCnt(String no) {
		return dao.replyCnt(sst, no);
	}

	//전체 목록 댓글 갯수 조회
	@Override
	public List<Integer> replyCntAll(List<String> voListNo) {
		return dao.replyCntAll(sst, voListNo);
	}

	//건의사항 목록 갯수
	@Override
	public int getSuggestionListCnt(Map<String, String> searchMap) {
		return dao.getSuggestionListCnt(sst, searchMap);
	}
	
	//건의사항 목록
	@Override
	public List<NoticeVo> suggstionList(PageVo pv, Map<String, String> searchMap) {
		return dao.suggstionList(sst, pv, searchMap);
	}

	//건의사항 복사
	@Override
	public int suggestionCopy(List<String> noList) {
		return dao.suggestionCopy(sst, noList);
	}

	//건의사항 삭제
	@Override
	public int suggestionDelete(List<String> noList) {
		return dao.suggestionDelete(sst, noList);
	}

	//공지사항으로 등록
	@Override
	public int noticeEnroll(List<String> noList) {
		return dao.noticeEnroll(sst, noList);
	}

	//건의사항 상세조회
	@Override
	public SuggestionVo suggestionDetail(String no) {
		dao.suggestionIncreaseHit(sst, no);
		return dao.suggestionDetail(sst, no);
	}

	//건의사항 댓글달기
	@Override
	public int suggestionReply(ReplyVo vo) {
		return dao.suggestionReply(sst, vo);
	}

	//건의사항 댓글 화며 보여주기
	@Override
	public List<ReplyVo> selectSuggestionReply(String no) {
		return dao.selectSuggestionReply(sst, no);
	}

	//건의 사항 댓글 수
	@Override
	public int suggestionReplyCnt(String no) {
		return dao.suggestionReplyCnt(sst, no);
	}

	//건의사항 댓글 삭제
	@Override
	public int suggestionReplyDelete(Map<String, String> replyMap) {
		return dao.suggestionReplyDelete(sst, replyMap);
	}
	
}
