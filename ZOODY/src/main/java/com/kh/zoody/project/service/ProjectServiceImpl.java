package com.kh.zoody.project.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.project.dao.ProjectDao;
import com.kh.zoody.project.vo.ProjectAllVo;
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

}
