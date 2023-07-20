package com.kh.zoody.employee.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.employee.dao.EmployeeDao;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	private final SqlSessionTemplate sst;
	private final EmployeeDao dao;

	//직원등록
	@Override
	public int enroll(UserVo vo) {
		return dao.enroll(sst, vo);
	}

	@Override
	public int edit(UserVo vo) {
		return 0;
	}

	//직원목록조회
	@Override
	public List<UserVo> list(PageVo pv) {
		return dao.list(sst, pv);
	}

	//페이징처리를 위한 게시글 갯수 조회
	@Override
	public int getEmployeeListCnt() {
		return dao.getEmployeeListCnt(sst);
	}

}
