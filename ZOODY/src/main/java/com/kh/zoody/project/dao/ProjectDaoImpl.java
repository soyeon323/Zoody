package com.kh.zoody.project.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectVo;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	//프로젝트 생성 유저 불러오기
	@Override
	public List<ProjectVo> selectUser(SqlSessionTemplate sst) {
		return sst.selectList("project.selectUser");
	}

	//프로젝트 팀 생성
	@Override
	public int insertPrj(SqlSessionTemplate sst, ProjectAllVo paVo) {
		return sst.insert("project.insertPrj", paVo);
	}

	//프로젝트 팀 번호 가져오기
	@Override
	public String selectPjNo(SqlSessionTemplate sst, String teamName) {
		return sst.selectOne("project.selectPjNo", teamName);
	}

	//프로젝트 멤버 insert
	@Override
	public int insertPrjMember(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("project.insertPrjMember", map);
	}

	//팀 생성 전에 팀명 중복되는지 확인
	@Override
	public List<String> selectTeamName(SqlSessionTemplate sst) {
		return sst.selectList("project.selectTeamName");
	}

	//화면으로 넘겨줄 프로젝트 정보
	@Override
	public List<ProjectVo> selectPj(SqlSessionTemplate sst, String pjNo) {
		return sst.selectList("project.selectPj", pjNo);
	}

}
