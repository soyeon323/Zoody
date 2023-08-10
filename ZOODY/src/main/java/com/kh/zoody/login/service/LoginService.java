package com.kh.zoody.login.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.login.dao.LoginDao;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class LoginService {
	
	private final LoginDao dao;
	private final SqlSessionTemplate sst;
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	//로그인 
	public UserVo login(UserVo vo ) {
		
		UserVo loginMember = dao.login(sst, vo);
		
		String userPwd = vo.getPwd();
		String dbPwd = loginMember.getPwd();
		
		log.info("dbPwd : {}",dbPwd);
		log.info("userPWd : {}",userPwd);

		
		boolean isMatch = encoder.matches(userPwd, dbPwd);
		if(!isMatch) {
			throw new RuntimeException();
		}
		return loginMember;
	}
	
	
}
