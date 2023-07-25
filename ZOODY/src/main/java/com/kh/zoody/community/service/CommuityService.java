package com.kh.zoody.community.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.community.vo.BoardVo;

public interface CommuityService {
	
	// 자유게시판 목록 가져오기
	List<BoardVo> getBoardList(int catNo);
	
	List<BoardVo> getBoardListByCount(int num);
	
	// 게시판 글쓰기
	int write(BoardVo vo);

	
	
	// 게시글 상세
	
	// 게시글 수정

	// 게시글 삭제
	
	// 게시글 검색
	
}
