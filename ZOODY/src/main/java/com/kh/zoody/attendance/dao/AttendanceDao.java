package com.kh.zoody.attendance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.attendance.vo.LeaveVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceDao {

	List<AttendanceVo> list(SqlSessionTemplate sst, PageVo pv);

	int getMyAttendanceCnt(SqlSessionTemplate sst);

	List<LeaveVo> leaveList(SqlSessionTemplate sst, PageVo leavePv);

	int getLeaveCnt(SqlSessionTemplate sst);


}
