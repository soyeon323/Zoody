package com.kh.zoody.calendar.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.calendar.vo.CalendarVo;

public interface CalendarService {

	List<Map<String, Object>> listAll();

	int addMonth(CalendarVo vo);


}
