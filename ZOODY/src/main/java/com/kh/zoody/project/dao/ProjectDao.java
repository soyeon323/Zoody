package com.kh.zoody.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.project.vo.ProjectVo;

public interface ProjectDao {

	//프로젝트 생성 유저 불러오기
	List<ProjectVo> selectUser(SqlSessionTemplate sst);

	//프로젝트 생성
	int insertPrj(SqlSessionTemplate sst, ProjectVo vo);

	//프로젝트 생성(팀insert)
	int insertPrjTeam(SqlSessionTemplate sst, ProjectVo vo);

	//프로젝트 생성 후 프로젝트 불러오기
	ProjectVo getPrjNo(SqlSessionTemplate sst, String teamName);

}
