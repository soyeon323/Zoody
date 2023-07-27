package com.kh.zoody.attendance.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.ExtraWorkVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceService {

	//유저 개별 조회 영역
	int getMyAttendanceCnt(String searchValue);
	
	List<AttendanceVo> list(PageVo pv, String searchValue);

	List<LeaveVo> leaveList(PageVo leavePv);

	int getLeaveCnt();

	//관리자 전체 조회 영역	
	int getAllAttendanceCnt();

	List<AttendanceVo> allList(PageVo allPv, Map<String, String> paramMap);

	//메인영역	
	int getMainAttCnt();

	int getMainLeaveCnt();

	List<AttendanceVo> mainAttlist(PageVo mPv);

	List<LeaveVo> mainLeList(PageVo mPv);

	List<AttendanceVo> mainDeList();
	
	//이의신청 조회 영역
	int getObjCnt();

	List<AttendanceVo> objList(PageVo objPv);

	//출근퇴근 영역
	int checkInWork(AttendanceVo attendanceVo);

	int checkOutWork(AttendanceVo attendanceVo);

	List<AttendanceVo> mainChartList();

	List<AttendanceVo> mainCalendarList();

	//출근 타입 카운
	int getCurrentTypeOneCnt();

	int getCurrentTypeSixCnt();

	int getCurrentTypeLeaveCnt();

	int getCurrentTypeFourCnt();

	//이의신청
	int submitOjection(Map<String, String> params);

	List<ExtraWorkVo> extraWorkList(PageVo leavePv);

	int getObjectionCnt();






}
