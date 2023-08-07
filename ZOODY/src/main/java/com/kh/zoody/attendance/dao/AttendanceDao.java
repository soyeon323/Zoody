package com.kh.zoody.attendance.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.ExtraWorkVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceDao {

	//유저 개별 조회 영역	
	List<AttendanceVo> list(SqlSessionTemplate sst, PageVo pv, String searchValue, String no);

	int getMyAttendanceCnt(SqlSessionTemplate sst, String searchValue, String no);

	List<LeaveVo> leaveList(SqlSessionTemplate sst, PageVo leavePv, String no);

	int getLeaveCnt(SqlSessionTemplate sst, String no);

	//관리자 전체 조회 영역
	int getAllAttendanceCnt(SqlSessionTemplate sst, Map<String, String> paramMap);

	List<AttendanceVo> allList(SqlSessionTemplate sst, PageVo allPv, Map<String, String> paramMap);

	//출퇴근 영역
	int checkInWork(SqlSessionTemplate sst, AttendanceVo attendanceVo);
	
	int checkOutWork(SqlSessionTemplate sst, AttendanceVo attendanceVo);
	
	//메인 영역
	int getMainAttCnt(SqlSessionTemplate sst, String no);

	int getMainLeaveCnt(SqlSessionTemplate sst, String no);

	List<AttendanceVo> mainAttlist(SqlSessionTemplate sst, PageVo mPv, String no);

	List<LeaveVo> mainLeList(SqlSessionTemplate sst, PageVo mPv, String no);

	List<AttendanceVo> mainDeList(SqlSessionTemplate sst, String departmentNo);
	
	//이의신청 조회 영역
	int getObjCnt(SqlSessionTemplate sst, Map<String, String> paramMap);

	List<AttendanceVo> objList(SqlSessionTemplate sst, PageVo objPv, Map<String, String> paramMap);

	List<AttendanceVo> mainChartList(SqlSessionTemplate sst);

	List<AttendanceVo> mainCalendarList(SqlSessionTemplate sst);

	//출근 타입 카운팅
	int getCurrentTypeOneCnt(SqlSessionTemplate sst, String no);

	int getCurrentTypeSixCnt(SqlSessionTemplate sst, String no);

	int getCurrentTypeLeaveCnt(SqlSessionTemplate sst, String no);

	int getCurrentTypeFourCnt(SqlSessionTemplate sst, String no);

	//이의신
	int submitOjection(SqlSessionTemplate sst, Map<String, String> params);

	List<ExtraWorkVo> extraWorkList(SqlSessionTemplate sst, PageVo workPv, String no);

	int getObjectionCnt(SqlSessionTemplate sst);

	int updateStatus(SqlSessionTemplate sst, Map<String, String> objParams);

	List<ExtraWorkVo> mainWorkList(SqlSessionTemplate sst, PageVo mPv, String no);

	int getUserAttendanceCnt(SqlSessionTemplate sst, String no);

	int getWorkCnt(SqlSessionTemplate sst, String no);

	boolean hasCheckInRecordToday(SqlSessionTemplate sst, AttendanceVo attendanceVo);

	boolean hasCheckOutRecordToday(SqlSessionTemplate sst, AttendanceVo attendanceVo);

	List<Map<String, Object>> monthList(SqlSessionTemplate sst, String no);

	List<Map<String, Object>> dataChart(SqlSessionTemplate sst, String no);









}
