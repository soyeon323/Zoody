package com.kh.zoody.project.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectVo;

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

}
