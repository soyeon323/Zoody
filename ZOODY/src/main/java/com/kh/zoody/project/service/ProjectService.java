package com.kh.zoody.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectTodoVo;
import com.kh.zoody.project.vo.ProjectVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

public interface ProjectService {

	//프로젝트 생성 유저불러오기
	List<ProjectVo> selectUser();

	//프로젝트 팀 생성
	int insertPrj(ProjectAllVo paVo);

	//프로젝트 팀 번호 가져오기
	String selectPjNo(String teamName);

	//프로젝트 멤버 insert
	int insertPrjMember(Map<String, Object> map);

	//화면으로 넘겨줄 프로젝트 정보
	List<ProjectVo> selectPj(String pjNo);

	//공지사항 화면 보여주기
	List<NoticeVo> getNoticeList(PageVo pv);

	//건의사항 화면 보여주기
	List<SuggestionVo> getSuggestionList(PageVo pv);

	//프로젝트 정보 가져오기
	List<ProjectVo> prjData();

	//프로젝트 삭제
	int prjDelete(String no);

	//프로젝트 멤버 삭제
	int prjMemberDelete(String no);

	//프로젝트 번호 가져오기
	List<ProjectVo> getByPrjNo(String title);

	//플젝 제목 가져오기
	String getTitle(String no);

	//할일 DB에 저장
	int insertTodo(Map<String, String> todoMap);

	//할일 목록 보여주기
	List<ProjectTodoVo> selectTodo(String no);

	//할일 삭제
	int todoDelete(String no);

	//프로젝트 참여한 멤버no 가져오기
	List<String> selectUserNo(String no);

	//채팅내용 저장
	int insertChat(HashMap<String, String> msgVo);

}