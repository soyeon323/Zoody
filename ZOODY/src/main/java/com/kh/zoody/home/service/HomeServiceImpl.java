package com.kh.zoody.home.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.home.dao.HomeDao;
import com.kh.zoody.notice.vo.NoticeVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class HomeServiceImpl implements HomeService{
	
	private final HomeDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<NoticeVo> getNewNotice() {
		return dao.getNewNotice(sst);
	}

}