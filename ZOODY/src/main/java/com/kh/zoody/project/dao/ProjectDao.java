package com.kh.zoody.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.project.vo.ProjectVo;

public interface ProjectDao {

	//프로젝트 생성 유저 불러오기
	List<ProjectVo> selectUser(SqlSessionTemplate sst);

}
