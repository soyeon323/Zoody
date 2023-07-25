package com.kh.zoody.addressbook.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

public interface AddressBookSerivce {

	// 모든 부서 정보 가져오기
	List<DepartmentVo> getDepartmentList();
	
	// 모든 사원 정보 가져오기
	List<UserVo> getUserList();

	// 해당 번호의 사원 상세 정보
	UserVo getDetailUserInfo(String userNo);
	
	// 키워드로 이름 검색
	List<UserVo> getUserInfoByKeyword(String keyword);
}
