package com.kh.zoody.project.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

public interface ProjectDao {

	//프로젝트 생성 유저 불러오기
	List<ProjectVo> selectUser(SqlSessionTemplate sst);

	//프로젝트 팀 생성
	int insertPrj(SqlSessionTemplate sst, ProjectAllVo paVo);

	//프로젝트 팀 번호 가져오기
	String selectPjNo(SqlSessionTemplate sst, String teamName);

	//프로젝트 멤버 insert
	int insertPrjMember(SqlSessionTemplate sst, Map<String, Object> map);

	//팀 생성 전에 팀명 중복되는지 확인
	List<String> selectTeamName(SqlSessionTemplate sst);

	//화면으로 넘겨줄 프로젝트 정보
	List<ProjectVo> selectPj(SqlSessionTemplate sst, String pjNo);

	//공지사항 화면 보여주기
	List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv);

	//건의사항 화면 보여주기
	List<SuggestionVo> getSuggestionList(SqlSessionTemplate sst, PageVo pv);

	//프로젝트 정보 가져오기
	List<ProjectVo> prjData(SqlSessionTemplate sst);

}
