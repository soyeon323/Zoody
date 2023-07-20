package com.kh.zoody.community.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.community.vo.BoardVo;

public interface CommunityDao {
	
	// 게시판 목록
	BoardVo Commuitylist();
	
	// 게시판 글쓰기
	int write(SqlSessionTemplate sst , BoardVo vo);
	
	// 게시글 상세
	
	// 게시글 수정

	// 게시글 삭제
	
	// 게시글 검색
		
	
}
