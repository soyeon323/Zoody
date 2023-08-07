package com.kh.zoody.calendar.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.calendar.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao{

	@Override
	public List<Map<String, Object>> listAll(SqlSessionTemplate sst) {
		return sst.selectList("calendar.listAll");
	}

	@Override
	public int addMonth(SqlSessionTemplate sst, CalendarVo vo) {
		return sst.insert("calendar.addMonth", vo);
	}

	@Override
	public int updateMonth(SqlSessionTemplate sst, CalendarVo vo) {
		return sst.update("calendar.updateMonth", vo);
	}

	@Override
	public int deleteMonth(SqlSessionTemplate sst, String no) {
		return sst.update("calendar.deleteMonth", no);
	}



}
