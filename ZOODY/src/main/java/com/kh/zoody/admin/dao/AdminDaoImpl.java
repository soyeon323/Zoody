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

}
