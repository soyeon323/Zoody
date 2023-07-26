package com.kh.zoody.employee.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

public interface EmployeeService {
	
	//직원등록
	int enroll(UserVo vo);
	
	//직원상세조회
	UserVo detail(String id);
	
	//직원목록 
	List<UserVo> list(PageVo pv, Map<String, String> searchMap);

	//페이징처리를 위한 전체 게시글 갯수 조회
	int getEmployeeListCnt(Map<String, String> searchMap);

	//직원정보 수정
	int edit(UserVo vo);



}
