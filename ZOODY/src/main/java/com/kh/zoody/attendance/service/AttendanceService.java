package com.kh.zoody.attendance.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.ExtraWorkVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceService {

	//유저 개별 조회 영역
	int getMyAttendanceCnt(String searchValue, String no);
	
	List<AttendanceVo> list(PageVo pv, String searchValue, String no);

	List<LeaveVo> leaveList(PageVo leavePv, String no);

	int getLeaveCnt(String no);

	//관리자 전체 조회 영역	
	int getAllAttendanceCnt(Map<String, String> paramMap);

	List<AttendanceVo> allList(PageVo allPv, Map<String, String> paramMap);

	//메인영역	
	int getMainAttCnt(String no);

	int getMainLeaveCnt(String no);

	List<AttendanceVo> mainAttlist(PageVo mPv, String no);

	List<LeaveVo> mainLeList(PageVo mPv, String no);

	List<AttendanceVo> mainDeList(String departmentNo);
	
	//이의신청 조회 영역
	int getObjCnt(Map<String, String> paramMap);

	List<AttendanceVo> objList(PageVo objPv, Map<String, String> paramMap);

	//출근퇴근 영역
	int checkInWork(AttendanceVo attendanceVo);

	int checkOutWork(AttendanceVo attendanceVo);

	List<AttendanceVo> mainChartList();

	List<AttendanceVo> mainCalendarList();

	//출근 타입 카운
	int getCurrentTypeOneCnt(String no);

	int getCurrentTypeSixCnt(String no);

	int getCurrentTypeLeaveCnt(String no);

	int getCurrentTypeFourCnt(String no);

	//이의신청
	int submitOjection(Map<String, String> params);

	List<ExtraWorkVo> extraWorkList(PageVo workPv, String no);

	int getObjectionCnt();

	int updateStatus(Map<String, String> objParams);

	List<ExtraWorkVo> mainWorkList(PageVo mPv, String no);

	int getUserAttendanceCnt(String no);

	int getWorkCnt(String no);

	boolean hasCheckInRecordToday(AttendanceVo attendanceVo);

	boolean hasCheckOutRecordToday(AttendanceVo attendanceVo);

	List<Map<String, Object>> monthList(String no);

	List<Map<String, Object>> dataChart(String no);

	List<AttendanceVo> chartList(String no, String formattedStartDate, String formattedEndDate);

//	Integer countSum(AttendanceVo vo, int i);







}
