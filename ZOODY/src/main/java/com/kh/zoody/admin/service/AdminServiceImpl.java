package com.kh.zoody.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.admin.dao.AdminDao;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminServiceImpl implements AdminService{
	private final AdminDao dao;
	private final SqlSessionTemplate sst;
	
	//공지사항 목록
	@Override
	public List<NoticeVo> list(PageVo pv) {
		return dao.list(sst, pv);
	}

	//공지사항 게시글 갯수 조회
	@Override
	public int getNoticeListCnt() {
		return dao.getNoticeListCnt(sst);
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
	
}
