package com.kh.zoody.addressbook.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.addressbook.dao.AddressbookDao;
import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AddressbookServiceImpl implements AddressBookSerivce {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	private final AddressbookDao addressbookDao;

	// 모든 부서 정보 가져오기
	@Override
	public List<DepartmentVo> getDepartmentList() {
		return addressbookDao.getDepartmentList(sqlSessionTemplate);
	}

	// 모든 사원 정보 가져오기
	@Override
	public List<UserVo> getUserList() {
		return addressbookDao.getUserList(sqlSessionTemplate);
	}

}
