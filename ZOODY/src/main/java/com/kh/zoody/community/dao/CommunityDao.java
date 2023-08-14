package com.kh.zoody.community.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.page.vo.PageVo;

public interface CommunityDao {
	
	// 게시판 목록
	List<BoardVo> getBoardList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap);

	// num 만큼 보드 리스트 가져오기
	List<BoardVo> getBoardListByCount(SqlSessionTemplate sst, String call);
	
	// 게시판 글쓰기
	int write(SqlSessionTemplate sst , BoardVo vo);

	// 게시글 상세
	BoardVo getBoardDetail(SqlSessionTemplate sst, int no);

	int increaseBoard(SqlSessionTemplate sst, int no);
	
	// 게시글 개수
	int getBoardListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);

	
	
	// 게시글 수정

	// 게시글 삭제
	
	// 게시글 검색
		
	
	
	// 투표 목록
	
	// 투표 작성
	
	// 투표 상세
	
	// 투표 수정
	
	// 투표 검색
	
}
