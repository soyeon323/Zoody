package com.kh.zoody.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.project.dao.ProjectDao;
import com.kh.zoody.project.vo.ProjectVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ProjectServiceImpl implements ProjectService{
	private final ProjectDao dao;
	private final SqlSessionTemplate sst;
	
	//프로젝트 생성 유저 불러오기
	@Override
	public List<ProjectVo> selectUser() {
		return dao.selectUser(sst);
	}

	//프로젝트 생성
	@Override
	public int insertPrj(ProjectVo vo) {
		return dao.insertPrj(sst, vo);
	}

	//프로젝트 생성(팀insert)
	@Override
	public int insertPrjTeam(ProjectVo vo) {
		return dao.insertPrjTeam(sst, vo);
	}

	//프로젝트 생성 후 프로젝트 불러오기
	@Override
	public ProjectVo getPrjNo(String teamName) {
		return dao.getPrjNo(sst, teamName);
	}

}
