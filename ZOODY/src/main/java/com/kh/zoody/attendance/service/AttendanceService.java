package com.kh.zoody.attendance.service;

import java.util.List;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceService {

	//페이징
	int getMyAttendanceCnt();
	
	//(서브메뉴) 근무현황 목록 조회
	List<AttendanceVo> list(PageVo pv);

	//휴가 요청 목록 조회
	List<LeaveVo> leaveList(PageVo leavePv);

	int getLeaveCnt();

}
