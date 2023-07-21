package com.kh.zoody.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.notice.vo.NoticeVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	//공지사항 목록
	@Override
	public List<NoticeVo> list(SqlSessionTemplate sst) {
		return sst.selectList("notice.list");
	}

}
