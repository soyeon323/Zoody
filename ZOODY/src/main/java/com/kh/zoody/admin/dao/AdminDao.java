package com.kh.zoody.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;

public interface AdminDao {

	//공지사항 목록
	List<NoticeVo> list(SqlSessionTemplate sst, PageVo pv);

	//공지사항 게시글 갯수 조회
	int getNoticeListCnt(SqlSessionTemplate sst);

	//게시글 복사
	int copy(SqlSessionTemplate sst, List<String> noList);

	//게시글 삭제
	int delete(SqlSessionTemplate sst, List<String> noList);

	//게시글 수정
	int edit(SqlSessionTemplate sst, NoticeVo vo);

	//공지사항 상세조회
	NoticeVo noticeDetail(SqlSessionTemplate sst, String no);

	//조회수 증가
	void increaseHit(SqlSessionTemplate sst, String no);

	//게시글 수정 화면
	NoticeVo selectEdit(SqlSessionTemplate sst, String no);

}
