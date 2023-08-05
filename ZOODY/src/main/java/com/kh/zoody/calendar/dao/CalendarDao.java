package com.kh.zoody.calendar.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.calendar.vo.CalendarVo;

public interface CalendarDao {

	List<Map<String, Object>> listAll(SqlSessionTemplate sst);

	int addMonth(SqlSessionTemplate sst, CalendarVo vo);


}
