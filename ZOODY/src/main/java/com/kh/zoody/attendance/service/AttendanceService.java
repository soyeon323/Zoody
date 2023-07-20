package com.kh.zoody.attendance.service;

import java.util.List;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceService {

	//(서브메뉴) 근무현황 목록 조회
	List<AttendanceVo> attMyList(PageVo myListPv);

	int getMyAttendanceCnt();

}
