package com.kh.zoody.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.project.vo.ProjectVo;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	//프로젝트 생성 유저 불러오기
	@Override
	public List<ProjectVo> selectUser(SqlSessionTemplate sst) {
		return sst.selectList("project.selectUser");
	}

	//프로젝트 생성
	@Override
	public int insertPrj(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.insert("project.insertPrj", vo);
	}

	//프로젝트 생성(팀insert)
	@Override
	public int insertPrjTeam(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.insert("project.insertPrjTeam", vo);
	}

	//프로젝트 생성 후 프로젝트 불러오기
	@Override
	public ProjectVo getPrjNo(SqlSessionTemplate sst, String teamName) {
		return sst.selectOne("project.getPrjNo", teamName);
	}

}
