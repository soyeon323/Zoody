package com.kh.zoody.attendance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.page.vo.PageVo;

public interface AttendanceDao {

	List<AttendanceVo> attMyList(SqlSessionTemplate sst, PageVo myListPv);

}
