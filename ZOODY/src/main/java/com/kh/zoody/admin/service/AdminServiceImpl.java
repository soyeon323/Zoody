package com.kh.zoody.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.admin.dao.AdminDao;
import com.kh.zoody.notice.vo.NoticeVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminServiceImpl implements AdminService{
	private final AdminDao dao;
	private final SqlSessionTemplate sst;
	
	//공지사항 목록
	@Override
	public List<NoticeVo> list() {
		return dao.list(sst);
	}

	
}
