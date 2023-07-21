package com.kh.zoody.pwd.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.pwd.dao.PwdSettingDao;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class PwdSettingService {
	
	private final PwdSettingDao psd;
	private final SqlSessionTemplate sst;

	// 비밀번호 설정을 위한 아이디(사번) 체크 로직
	public int idCheck(UserVo vo) {
		return psd.idCheck(sst, vo);
	}
	
	
}
