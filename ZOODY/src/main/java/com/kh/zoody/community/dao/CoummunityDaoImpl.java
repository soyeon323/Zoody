package com.kh.zoody.community.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.community.vo.BoardVo;

@Repository
public class CoummunityDaoImpl implements CommunityDao {

	@Override
	public BoardVo Commuitylist() {
		return null;
	}

	@Override
	public int write(SqlSessionTemplate sst, BoardVo vo) {
		return sst.insert("coummunity.write" , vo);
	}
	
	
}
