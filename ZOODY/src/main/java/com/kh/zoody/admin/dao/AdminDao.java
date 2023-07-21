package com.kh.zoody.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;

public interface AdminDao {

	//공지사항 목록
	List<NoticeVo> list(SqlSessionTemplate sst);

}
