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

}
