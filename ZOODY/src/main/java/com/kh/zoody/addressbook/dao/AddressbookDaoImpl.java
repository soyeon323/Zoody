package com.kh.zoody.addressbook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

@Repository
public class AddressbookDaoImpl implements AddressbookDao {

	// 모든 부서 정보 가져오기
	@Override
	public List<DepartmentVo> getDepartmentList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("department.getAllDepartmentInfo");
	}

	// 모든 사원 정보 가져오기
	@Override
	public List<UserVo> getUserList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("user.getUserNameAndRankInfo");
	}

	// 해당 번호의 사원 상세 정보
	@Override
	public UserVo getDetailUserInfo(String userNo, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("user.getUserDetailInfoByNo2", userNo);
	}
	
	// 키워드로 이름 검색
	@Override
	public List<UserVo> getUserInfoByKeyword(String keyword, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("user.searchUserInfoByKeyword", keyword);
	}
	
	// 간단한 유저 정보(이름, 메일)
	@Override
	public UserVo getBriefUserInfo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("user.getBriefUserInfo", no);
	}
	
}
