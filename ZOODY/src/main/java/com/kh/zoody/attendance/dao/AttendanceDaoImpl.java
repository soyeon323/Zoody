package com.kh.zoody.attendance.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.page.vo.PageVo;

@Repository
public class AttendanceDaoImpl implements AttendanceDao{

	@Override
	public List<AttendanceVo> list(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("attendance.selectList", null, rb);
	}

	@Override
	public int getMyAttendanceCnt(SqlSessionTemplate sst) {
		return sst.selectOne("attendance.getMyAttendanceCnt");
	}

}
