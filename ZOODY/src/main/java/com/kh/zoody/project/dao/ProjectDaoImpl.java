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

}
