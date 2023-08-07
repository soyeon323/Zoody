package com.kh.zoody.attendance.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.ExtraWorkVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

@Repository
public class AttendanceDaoImpl implements AttendanceDao{

	//내 출결 목록 조회 영역
	@Override
	public int getMyAttendanceCnt(SqlSessionTemplate sst, String searchValue, String no) {
		return sst.selectOne("attendance.getMyAttendanceCnt", searchValue);
	}
	
	@Override
	public List<AttendanceVo> list(SqlSessionTemplate sst, PageVo pv, String searchValue, String no) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("attendance.selectList", searchValue, rb);
	}

	@Override
	public List<LeaveVo> leaveList(SqlSessionTemplate sst, PageVo leavePv, String no) {
		RowBounds rb = new RowBounds(leavePv.getOffset(), leavePv.getBoardLimit());
		return sst.selectList("attendance.selectLeaveList", no, rb);
	}

	@Override
	public int getLeaveCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getLeaveCnt", no);
	}

	//관리자 목록 조회 영역
	@Override
	public int getAllAttendanceCnt(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("attendance.getAllAttendanceCnt", paramMap);
	}

	@Override
	public List<AttendanceVo> allList(SqlSessionTemplate sst, PageVo allPv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(allPv.getOffset(), allPv.getBoardLimit());
		return sst.selectList("attendance.selectAllList", paramMap, rb);
	}

	//메인 영역
	@Override
	public int getMainAttCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getMainAttCnt", no);
	}

	@Override
	public int getMainLeaveCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getMainLeaveCnt", no);
	}

	@Override
	public List<AttendanceVo> mainAttlist(SqlSessionTemplate sst, PageVo mPv, String no) {
		RowBounds rb = new RowBounds(mPv.getOffset(), mPv.getBoardLimit());
		return sst.selectList("attendance.selectMainAttlist", no, rb);
	}

	@Override
	public List<LeaveVo> mainLeList(SqlSessionTemplate sst, PageVo mPv, String no) {
		RowBounds rb = new RowBounds(mPv.getOffset(), mPv.getBoardLimit());
		return sst.selectList("attendance.selectMainLeList", no, rb);
	}

	@Override
	public List<AttendanceVo> mainDeList(SqlSessionTemplate sst, String departmentNo) {
		return sst.selectList("attendance.selectMainDeList", departmentNo);
	}
	
	//이의신청 조회 영역
	@Override
	public int getObjCnt(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("attendance.getObjCnt", paramMap);
	}

	@Override
	public List<AttendanceVo> objList(SqlSessionTemplate sst, PageVo objPv, Map<String, String> paramMap) {
		RowBounds rb = new RowBounds(objPv.getOffset(), objPv.getBoardLimit());
		return sst.selectList("attendance.selectObjList", paramMap, rb);
	}

	//출퇴근 영역
//	@Override
//	public int checkInWork(SqlSessionTemplate sst, @Param("loginMemberNo") int loginMemberNo, @Param("parsedTime") Date parsedTime) {
//	    Map<String, Object> params = new HashMap<>();
//	    params.put("loginMemberNo", loginMemberNo);
//	    params.put("parsedTime", parsedTime);
//	    return sst.insert("attendance.checkInWork", params);
//	}
	
	@Override
	public int checkInWork(SqlSessionTemplate sst, AttendanceVo attendanceVo) {
	    return sst.insert("attendance.checkInWork", attendanceVo);
	}

	@Override
	public int checkOutWork(SqlSessionTemplate sst, AttendanceVo attendanceVo) {
		return sst.update("attendance.checkOutWork", attendanceVo);
	}

	@Override
	public List<AttendanceVo> mainChartList(SqlSessionTemplate sst) {
		return sst.selectList("attendance.selectChartList");
	}

	@Override
	public List<AttendanceVo> mainCalendarList(SqlSessionTemplate sst) {
		return sst.selectList("attendance.selectCalendarList");
	}

	@Override
	public int getCurrentTypeOneCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getCurrentTypeOneCnt", no);
	}

	@Override
	public int getCurrentTypeSixCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getCurrentTypeSixCnt", no);
	}

	@Override
	public int getCurrentTypeLeaveCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getCurrentTypeLeaveCnt", no);
	}

	@Override
	public int getCurrentTypeFourCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getCurrentTypeFourCnt", no);
	}

	@Override
	public int submitOjection(SqlSessionTemplate sst, Map<String, String> params) {
		return sst.update("attendance.submitOjection",params);
	}

	@Override
	public List<ExtraWorkVo> extraWorkList(SqlSessionTemplate sst, PageVo workPv, String no) {
		RowBounds rb = new RowBounds(workPv.getOffset(), workPv.getBoardLimit());
		return sst.selectList("attendance.selectExtraWorkList", no, rb);
	}

	@Override
	public int getObjectionCnt(SqlSessionTemplate sst) {
	    return sst.selectOne("attendance.getObjectionCount");
	}

	@Override
	public int updateStatus(SqlSessionTemplate sst, Map<String, String> objParams) {
		return sst.update("attendance.updateStatus", objParams);
	}

	@Override
	public List<ExtraWorkVo> mainWorkList(SqlSessionTemplate sst, PageVo mPv, String no) {
		RowBounds rb = new RowBounds(mPv.getOffset(), mPv.getBoardLimit());
		return sst.selectList("attendance.selectMainWorkList", no, rb);
	}

	@Override
	public int getUserAttendanceCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getUserAttendanceCnt", no);
	}

	@Override
	public int getWorkCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("attendance.getWorkCnt", no);
	}

	@Override
	public boolean hasCheckInRecordToday(SqlSessionTemplate sst, AttendanceVo attendanceVo) {
		
		int count = sst.selectOne("attendance.hasCheckInRecordToday", attendanceVo);
		
		return count > 0;
	}

	@Override
	public boolean hasCheckOutRecordToday(SqlSessionTemplate sst, AttendanceVo attendanceVo) {
		
		int count = sst.selectOne("attendance.hasCheckOutRecordToday", attendanceVo);
		
		return count > 0;
	}

	@Override
	public List<Map<String, Object>> monthList(SqlSessionTemplate sst, String no) {
		return sst.selectList("attendance.monthList", no);
	}

	@Override
	public List<Map<String, Object>> dataChart(SqlSessionTemplate sst, String no) {
		return sst.selectList("attendance.dataChart", no);
	}

	


	







}
