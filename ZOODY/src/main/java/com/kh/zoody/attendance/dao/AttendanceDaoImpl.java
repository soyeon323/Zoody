package com.kh.zoody.attendance.dao;

import java.util.List;

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



}
