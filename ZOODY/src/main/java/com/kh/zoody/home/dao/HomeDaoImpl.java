package com.kh.zoody.home.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.notice.vo.NoticeVo;

@Repository
public class HomeDaoImpl implements HomeDao{

	@Override
	public List<NoticeVo> getNewNotice(SqlSessionTemplate sst) {
		return sst.selectList("home.getNewNotice");
	}
	
	
	
}
