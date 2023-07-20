package com.kh.zoody.attendance.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.attendance.dao.AttendanceDao;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService{
	
	private final SqlSessionTemplate sst;
	private final AttendanceDao dao;
	
	
	//(서브메뉴) 근무현황 목록 조회	
	@Override
	public List<AttendanceVo> list(PageVo pv) {
		return dao.list(sst, pv);
	}


	@Override
	public int getMyAttendanceCnt() {
		return dao.getMyAttendanceCnt(sst);
	}
	
	

}
