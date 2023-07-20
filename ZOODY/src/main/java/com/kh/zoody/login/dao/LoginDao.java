package com.kh.zoody.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.user.vo.UserVo;

@Repository
public class LoginDao {

	//로그인 
	public UserVo login(SqlSessionTemplate sst, UserVo vo) {
		return sst.selectOne("login.login" ,vo);
	}

}
