package com.kh.zoody.meetingroom.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.meetingroom.vo.MeetingroomVo;

public interface MeetingroomDao {

	List<MeetingroomVo> selectList(SqlSessionTemplate sst);

	int addMeetingroom(SqlSessionTemplate sst, MeetingroomVo mvo);

}
