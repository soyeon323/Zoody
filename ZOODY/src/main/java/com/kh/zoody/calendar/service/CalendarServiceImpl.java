package com.kh.zoody.calendar.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.zoody.calendar.dao.CalendarDao;
import com.kh.zoody.calendar.vo.CalendarVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService{
	
	private final CalendarDao dao;
	private final SqlSessionTemplate sst;

	@Override
	public List<Map<String, Object>> listAll() {
		return dao.listAll(sst);
	}

	@Override
	public int addMonth(CalendarVo vo) {
		return dao.addMonth(sst, vo);
	}

	@Override
	public int updateMonth(CalendarVo vo) {
		return dao.updateMonth(sst, vo);
	}

	@Override
	public int deleteMonth(String no) {
		return dao.deleteMonth(sst, no);
	}


}
