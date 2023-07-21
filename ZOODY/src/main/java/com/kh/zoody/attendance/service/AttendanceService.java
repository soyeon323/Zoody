package com.kh.zoody.attendance.service;

import java.util.List;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceService {

	//유저 개별 조회 영역
	int getMyAttendanceCnt();
	
	List<AttendanceVo> list(PageVo pv);

	List<LeaveVo> leaveList(PageVo leavePv);

	int getLeaveCnt();

	//관리자 전체 조회 영역	
	int getAllAttendanceCnt();

	List<AttendanceVo> allList(PageVo allPv);

	//메인영역	
	int getMainAttCnt();

	int getMainLeaveCnt();

	List<AttendanceVo> mainAttlist(PageVo mPv);

	List<LeaveVo> mainLeList(PageVo mPv);

	//이의신청 조회 영역
	int getObjCnt();

	List<AttendanceVo> objList(PageVo objPv);



}
