package com.kh.zoody.meetingroom.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.meetingroom.vo.MeetingroomReservationVo;
import com.kh.zoody.meetingroom.vo.MeetingroomVo;

public interface MeetingroomDao {

	List<MeetingroomVo> selectList(SqlSessionTemplate sst);

	int addMeetingroom(SqlSessionTemplate sst, MeetingroomVo mvo);

	int mtDelete(SqlSessionTemplate sst, String no);

	MeetingroomVo selectDetail(SqlSessionTemplate sst, String no);

	int updateMeetingroom(SqlSessionTemplate sst, MeetingroomVo mvo);

	List<Map<String, Object>> reserveTime(SqlSessionTemplate sst, String meetingroomNo, String date);

	int addReserve(SqlSessionTemplate sst, MeetingroomReservationVo mrv);

	List<String> getReservedTimes(SqlSessionTemplate sst, String meetingroomNo, String date);

	List<MeetingroomReservationVo> reserveTimeList(SqlSessionTemplate sst, String meetingroomNo, String date);

	int checkTime(SqlSessionTemplate sst, String meetingroomNo, String date, String startTime);

	int addReserveInfoToCalendar(SqlSessionTemplate sst, MeetingroomReservationVo mrv);


}
