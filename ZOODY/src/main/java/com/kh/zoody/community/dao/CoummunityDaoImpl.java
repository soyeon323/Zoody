package com.kh.zoody.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CoummunityDaoImpl implements CommunityDao {

	
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

	@Override
	public int increaseBoard(SqlSessionTemplate sst, int no) {
		return sst.update("community.increaseBoard", no);
	}

	@Override
	public int getBoardListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("community.getBaordListCnt",searchMap);
	}

	@Override
	public List<BoardVo> getBoardList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("community.getBoardList", searchMap , rb);
	}


	
	
	
}
