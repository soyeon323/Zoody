package com.kh.zoody.attendance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.page.vo.PageVo;

@Repository
public class AttendanceDaoImpl implements AttendanceDao{

	@Override
	public List<AttendanceVo> attMyList(SqlSessionTemplate sst, PageVo myListPv) {
		return sst.selectList("attMyList", myListPv);
	}

}
