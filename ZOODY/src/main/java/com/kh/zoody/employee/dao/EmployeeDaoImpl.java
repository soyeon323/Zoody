package com.kh.zoody.employee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	@Override
	public int enroll(SqlSessionTemplate sst, UserVo vo) {
		return sst.insert("user.enroll", vo);
	}

	@Override
	public int edit(SqlSessionTemplate sst, UserVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserVo> list(SqlSessionTemplate sst, PageVo pv) {
		// TODO Auto-generated method stub
		return null;
	}

}
