package com.kh.zoody.community.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.community.vo.BoardVo;

@Repository
public class CoummunityDaoImpl implements CommunityDao {

	@Override
	public List<BoardVo> getBoardList(SqlSessionTemplate sst, int catNo) {
		return sst.selectList("community.getBoardList", catNo);
	}
	
	@Override
	public List<BoardVo> getBoardListByCount(SqlSessionTemplate sst, String call) {
		return sst.selectList("community.getBoardList", call);
	}
	
	@Override
	public int write(SqlSessionTemplate sst, BoardVo vo) {
		return sst.insert("community.write" , vo);
	}

	@Override
	public BoardVo getBoardDetail(SqlSessionTemplate sst, int no) {
		return sst.selectOne("community.detail" , no);
	}


	
	
	
}
