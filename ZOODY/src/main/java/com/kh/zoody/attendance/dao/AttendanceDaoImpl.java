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

	@Override
	public int getAllAttendanceCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getAllAttendanceCnt");
	}

	@Override
	public List<AttendanceVo> allList(SqlSessionTemplate sst, PageVo allPv) {
		RowBounds rb = new RowBounds(allPv.getOffset(), allPv.getBoardLimit());
		return sst.selectList("attendance.selectAllList", null, rb);
	}

}
