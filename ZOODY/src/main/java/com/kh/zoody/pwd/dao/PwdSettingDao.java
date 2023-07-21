package com.kh.zoody.pwd.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.user.vo.UserVo;

@Repository
public class PwdSettingDao {
	
	//비밀번호 설정을 위한 아이디(사번)체크 로직
	public int idCheck(SqlSessionTemplate sst, UserVo vo) {
		return sst.selectOne("login.pwdSetting" ,vo);
	}

}
