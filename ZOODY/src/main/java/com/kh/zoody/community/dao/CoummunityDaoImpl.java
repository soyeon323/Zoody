package com.kh.zoody.community.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.community.vo.BoardVo;

@Repository
public class CoummunityDaoImpl implements CommunityDao {

	@Override
	public List<BoardVo> getBoardList(SqlSessionTemplate sst, int catNo) {
		return sst.selectList("coummunity.getBoardList", catNo);
	}
	
	@Override
	public List<BoardVo> getBoardListByCount(SqlSessionTemplate sst, int num) {
		return sst.selectList("coummunity.getBoardList", num);
	}
	
	@Override
	public int write(SqlSessionTemplate sst, BoardVo vo) {
		return sst.insert("coummunity.write" , vo);
	}


	
	
	
}
