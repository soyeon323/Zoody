package com.kh.zoody.community.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.community.dao.CommunityDao;
import com.kh.zoody.community.vo.BoardVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class CoummunityServiceImpl implements CommuityService{
	
	private final SqlSessionTemplate sst;
	private final CommunityDao dao;
	
	@Override
	public List<BoardVo> getBoardList(int catNo) {
		return dao.getBoardList(sst, catNo);
	}

	
	@Override
	public int write(BoardVo vo) {
		return dao.write(sst, vo);
	}


	@Override
	public List<BoardVo> getBoardListByCount(int num) {
		return dao.getBoardListByCount(sst, num);
	}



	
	
	
	
	
}
