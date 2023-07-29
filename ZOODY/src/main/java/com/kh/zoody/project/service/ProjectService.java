package com.kh.zoody.project.service;

import java.util.List;

import com.kh.zoody.project.vo.ProjectVo;

public interface ProjectService {

	//프로젝트 생성 유저불러오기
	List<ProjectVo> selectUser();

}
