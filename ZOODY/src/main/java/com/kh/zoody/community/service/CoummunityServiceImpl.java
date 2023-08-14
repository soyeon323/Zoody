package com.kh.zoody.community.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.community.dao.CommunityDao;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class CoummunityServiceImpl implements CommuityService{
	
	private final SqlSessionTemplate sst;
	private final CommunityDao dao;
	

	
	@Override
	public int write(BoardVo vo) {
		return dao.write(sst, vo);
	}


	@Override
	public List<BoardVo> getBoardListByCount(String call) {
		return dao.getBoardListByCount(sst, call);
	}


	@Override
	public BoardVo getBoardDetail(int no) {
		int result = dao.increaseBoard(sst,no);
		if(result < 1) {
			return null;
		}
		return dao.getBoardDetail(sst , no);
	}


	@Override
	public int getBoardListCnt(Map<String, String> searchMap) {
		return dao.getBoardListCnt(sst , searchMap);
	}


	@Override
	public List<BoardVo> getBoardList(PageVo pv, Map<String, String> searchMap) {
		return dao.getBoardList(sst , pv, searchMap);
	}



	
	
	
	
	
}
