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
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

@Repository
public class AttendanceDaoImpl implements AttendanceDao{

	//내 출결 목록 조회 영역
	@Override
	public int getMyAttendanceCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getMyAttendanceCnt");
	}
	
	@Override
	public List<AttendanceVo> list(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("attendance.selectList", null, rb);
	}

	@Override
	public List<LeaveVo> leaveList(SqlSessionTemplate sst, PageVo leavePv) {
		RowBounds rb = new RowBounds(leavePv.getOffset(), leavePv.getBoardLimit());
		return sst.selectList("attendance.selectLeaveList", null, rb);
	}

	@Override
	public int getLeaveCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getLeaveCnt");
	}

	//관리자 목록 조회 영역
	@Override
	public int getAllAttendanceCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getAllAttendanceCnt");
	}

	@Override
	public List<AttendanceVo> allList(SqlSessionTemplate sst, PageVo allPv) {
		RowBounds rb = new RowBounds(allPv.getOffset(), allPv.getBoardLimit());
		return sst.selectList("attendance.selectAllList", null, rb);
	}

	//메인 영역
	@Override
	public int getMainAttCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getMainAttCnt");
	}

	@Override
	public int getMainLeaveCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getMainLeaveCnt");
	}

	@Override
	public List<AttendanceVo> mainAttlist(SqlSessionTemplate sst, PageVo mPv) {
		RowBounds rb = new RowBounds(mPv.getOffset(), mPv.getBoardLimit());
		return sst.selectList("attendance.selectMainAttlist", null, rb);
	}

	@Override
	public List<LeaveVo> mainLeList(SqlSessionTemplate sst, PageVo mPv) {
		RowBounds rb = new RowBounds(mPv.getOffset(), mPv.getBoardLimit());
		return sst.selectList("attendance.selectMainLeList", null, rb);
	}

	@Override
	public List<AttendanceVo> mainDeList(SqlSessionTemplate sst) {
		return sst.selectList("attendance.selectMainDeList");
	}
	
	//이의신청 조회 영역
	@Override
	public int getObjCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getObjCnt");
	}

	@Override
	public List<AttendanceVo> objList(SqlSessionTemplate sst, PageVo objPv) {
		RowBounds rb = new RowBounds(objPv.getOffset(), objPv.getBoardLimit());
		return sst.selectList("attendance.selectObjList", null, rb);
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






}
