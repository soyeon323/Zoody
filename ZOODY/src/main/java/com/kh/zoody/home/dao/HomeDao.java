package com.kh.zoody.home.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;

public interface HomeDao {

	List<NoticeVo> getNewNotice(SqlSessionTemplate sst);

}
