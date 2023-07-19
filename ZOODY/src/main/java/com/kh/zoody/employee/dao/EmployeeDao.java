package com.kh.zoody.employee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

public interface EmployeeDao {

	//직원등록
	int enroll(SqlSessionTemplate sst, UserVo vo);
	
	//직원상세조회 및 수정
	int edit(SqlSessionTemplate sst, UserVo vo);
	
	//직원목록 
	List<UserVo> list(SqlSessionTemplate sst, PageVo pv);
	
}
