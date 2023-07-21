package com.kh.zoody.attendance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceDao {

	//유저 개별 조회 영역	
	List<AttendanceVo> list(SqlSessionTemplate sst, PageVo pv);

	int getMyAttendanceCnt(SqlSessionTemplate sst);

	List<LeaveVo> leaveList(SqlSessionTemplate sst, PageVo leavePv);

	int getLeaveCnt(SqlSessionTemplate sst);

	//관리자 전체 조회 영역
	int getAllAttendanceCnt(SqlSessionTemplate sst);

	List<AttendanceVo> allList(SqlSessionTemplate sst, PageVo allPv);

	//메인 영역
	int getMainAttCnt(SqlSessionTemplate sst);

	int getMainLeaveCnt(SqlSessionTemplate sst);

	List<AttendanceVo> mainAttlist(SqlSessionTemplate sst, PageVo mPv);

	List<LeaveVo> mainLeList(SqlSessionTemplate sst, PageVo mPv);

	//이의신청 조회 영역
	int getObjCnt(SqlSessionTemplate sst);

	List<AttendanceVo> objList(SqlSessionTemplate sst, PageVo objPv);




}
