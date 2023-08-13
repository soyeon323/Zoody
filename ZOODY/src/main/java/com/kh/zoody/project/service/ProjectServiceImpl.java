package com.kh.zoody.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.project.dao.ProjectDao;
import com.kh.zoody.project.vo.ChattingVo;
import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectTodoVo;
import com.kh.zoody.project.vo.ProjectVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class ProjectServiceImpl implements ProjectService{
	private final ProjectDao dao;
	private final SqlSessionTemplate sst;
	
	//프로젝트 생성 유저 불러오기
	@Override
	public List<ProjectVo> selectUser() {
		return dao.selectUser(sst);
	}

	//프로젝트 팀 생성
	@Override
	public int insertPrj(ProjectAllVo paVo) {
		//팀 생성 전에 팀명 중복되는지 확인
		List<String> teamNameList = dao.selectTeamName(sst);
		
		for(String teamName : teamNameList) {
			if(teamName.equals(paVo.getTeamName())) {
				throw new RuntimeException("팀이름 중복");
			}
		}
		return dao.insertPrj(sst, paVo);
	}

	//프로젝트 팀 번호 가져오기
	@Override
	public String selectPjNo(String teamName) {
		return dao.selectPjNo(sst, teamName);
	}

	//프로젝트 멤버 insert
	@Override
	public int insertPrjMember(Map<String, Object> map) {
		return dao.insertPrjMember(sst, map);
	}

	//화면으로 넘겨줄 프로젝트 정보
	@Override
	public List<ProjectVo> selectPj(String pjNo) {
		return dao.selectPj(sst, pjNo);
	}

	//공지사항 화면 보여주기
	@Override
	public List<NoticeVo> getNoticeList(PageVo pv) {
		return dao.getNoticeList(sst, pv);
	}

	//건의사항 화면 보여주기
	@Override
	public List<SuggestionVo> getSuggestionList(PageVo pv) {
		return dao.getSuggestionList(sst, pv);
	}

	//프로젝트 정보 가져오기
	@Override
	public List<ProjectVo> prjData() {
		return dao.prjData(sst);
	}

	//프로젝트 삭제
	@Override
	public int prjDelete(String no) {
		return dao.prjDelete(sst, no);
	}

	//프로젝트 멤버 삭제
	@Override
	public int prjMemberDelete(String no) {
		return dao.prjMemberDelete(sst, no);
	}

	//프로젝트 번호 가져오기
	@Override
	public List<ProjectVo> getByPrjNo(String title) {
		return dao.getByPrjNo(sst, title);
	}

	//플젝 제목 가져오기
	@Override
	public String getTitle(String no) {
		return dao.getTitle(sst, no);
	}

	//할일 DB에 저장
	@Override
	public int insertTodo(Map<String, String> todoMap) {
		return dao.insertTodo(sst, todoMap);
	}

	//할일 목록 보여주기
	@Override
	public List<ProjectTodoVo> selectTodo(String no) {
		return dao.selectTodo(sst, no);
	}

	//할일 삭제
	@Override
	public int todoDelete(String no) {
		return dao.todoDelete(sst, no);
	}

	//프로젝트 참여한 멤버no 가져오기
	@Override
	public List<String> selectUserNo(String no) {
		return dao.selectUserNo(sst, no);
	}

	//채팅내용 저장(방)
	@Override
	public int insertChat(HashMap<String, String> msgVo) {
		return dao.insertChat(sst, msgVo);
	}

	//채팅내용 저장
	@Override
	public int insertMessage(HashMap<String, String> msgVo) {
		return dao.insertMessage(sst, msgVo);
	}

	//채팅내용 불러오기
	@Override
	public List<ChattingVo> selectMessage() {
		return dao.selectMessage(sst);
	}

}