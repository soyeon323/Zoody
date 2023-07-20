package com.kh.zoody.login.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.zoody.login.dao.LoginDao;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginService {
	
	private final LoginDao dao;
	private final SqlSessionTemplate sst;
	
	//로그인 
	public UserVo login(UserVo vo) {
		return dao.login(sst,vo);
	}
}
