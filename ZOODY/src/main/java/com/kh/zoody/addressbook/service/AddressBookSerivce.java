package com.kh.zoody.addressbook.service;

import java.util.List;

import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

public interface AddressBookSerivce {

	// 모든 부서 정보 가져오기
	List<DepartmentVo> getDepartmentList();
	
	// 모든 사원 정보 가져오기
	List<UserVo> getUserList();
	
}
