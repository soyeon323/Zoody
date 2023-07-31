package com.kh.zoody.project.service;

import java.util.List;

import com.kh.zoody.project.vo.ProjectVo;

public interface ProjectService {

	//프로젝트 생성 유저불러오기
	List<ProjectVo> selectUser();

	//프로젝트 생성
	int insertPrj(ProjectVo vo);

	//프로젝트 생성(팀insert)
	int insertPrjTeam(ProjectVo vo);

	//프로젝트 생성 후 프로젝트 불러오기
	ProjectVo getPrjNo(String teamName);

}
