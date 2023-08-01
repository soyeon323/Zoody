package com.kh.zoody.project.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectVo;

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

}
