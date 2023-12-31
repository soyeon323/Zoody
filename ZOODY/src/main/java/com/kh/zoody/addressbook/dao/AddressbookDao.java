package com.kh.zoody.addressbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

public interface AddressbookDao {

	// 모든 부서 정보 가져오기
	List<DepartmentVo> getDepartmentList(SqlSessionTemplate sqlSessionTemplate);
	
	// 모든 사원 정보 가져오기
	List<UserVo> getUserList(SqlSessionTemplate sqlSessionTemplate);

	// 해당 번호의 사원 상세 정보
	UserVo getDetailUserInfo(String userNo, SqlSessionTemplate sqlSessionTemplate);
	
	// 키워드로 이름 검색
	List<UserVo> getUserInfoByKeyword(String keyword, SqlSessionTemplate sqlSessionTemplate);

	// 간단한 유저 정보(이름, 메일)
	UserVo getBriefUserInfo(String no, SqlSessionTemplate sqlSessionTemplate);
}
