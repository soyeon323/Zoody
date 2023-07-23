package com.kh.zoody.admin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	//공지사항 목록
	@Override
	public List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("notice.list", null, rb);
	}

	//공지사항 게시글 갯수 조회
	@Override
	public int getNoticeListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("notice.getNoticeListCnt");
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
		return 0;
	}

	//공지사항 상세조회
	@Override
	public NoticeVo noticeDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.detail", no);
	}

	//조회수 증가
	@Override
	public void increaseHit(SqlSessionTemplate sst, String no) {
		sst.update("notice.increaseHit", no);
	}

	//게시글 수정 화면
	@Override
	public NoticeVo selectEdit(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.selectEdit", no);
	}

}
