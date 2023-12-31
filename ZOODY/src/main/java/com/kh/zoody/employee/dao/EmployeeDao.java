package com.kh.zoody.employee.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

public interface EmployeeDao {

	//직원등록
	int enroll(SqlSessionTemplate sst, UserVo vo);
	
	//직원상세조회
	UserVo detail(SqlSessionTemplate sst, String id);

	//직원목록 
	List<UserVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap);

	//페이징처리를 위한 게시글 갯수 조회
	int getEmployeeListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);

	//직원정보수정
	int edit(SqlSessionTemplate sst, UserVo vo);


	
}
