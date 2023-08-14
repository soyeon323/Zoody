package com.kh.zoody.community.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.page.vo.PageVo;

public interface CommuityService {
	
	// 자유게시판 목록 가져오기
	
	List<BoardVo> getBoardListByCount(String call);
	
	// 게시판 글쓰기
	int write(BoardVo vo);
	
	// 게시글 상세
	BoardVo getBoardDetail(int no);
	
	//게시글 개수
	int getBoardListCnt(Map<String, String> searchMap);

	List<BoardVo> getBoardList(PageVo pv, Map<String, String> searchMap);
	

	
	
	
	// 게시글 수정

	// 게시글 삭제
	
	// 게시글 검색
	
}
