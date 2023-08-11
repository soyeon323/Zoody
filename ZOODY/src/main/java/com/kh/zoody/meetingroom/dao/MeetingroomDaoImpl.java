package com.kh.zoody.meetingroom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.meetingroom.vo.MeetingroomReservationVo;
import com.kh.zoody.meetingroom.vo.MeetingroomVo;

@Repository
public class MeetingroomDaoImpl implements MeetingroomDao {

	@Override
	public List<MeetingroomVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("meetingroom.selectList", sst);
	}

	@Override
	public int addMeetingroom(SqlSessionTemplate sst, MeetingroomVo mvo) {
		return sst.insert("meetingroom.addMeetingroom", mvo);
	}

	@Override
	public int mtDelete(SqlSessionTemplate sst, String no) {
		return sst.update("meetingroom.mtDelete", no);
	}

	@Override
	public MeetingroomVo selectDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("meetingroom.selectDetail", no);
	}

	@Override
	public int updateMeetingroom(SqlSessionTemplate sst, MeetingroomVo mvo) {
		return sst.update("meetingroom.updateMeetingroom", mvo);
	}

	@Override
	public List<Map<String, Object>> reserveTime(SqlSessionTemplate sst, String meetingroomNo, String date) {
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("meetingroomNo", meetingroomNo);
	    parameters.put("date", date);
	    
		return sst.selectList("meetingroom.reserveTimeList", parameters);
	}

	@Override
	public int addReserve(SqlSessionTemplate sst, MeetingroomReservationVo mrv) {
		return sst.insert("meetingroom.addReserve", mrv);
	}

	@Override
	public List<String> getReservedTimes(SqlSessionTemplate sst, String meetingroomNo, String date) {
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("meetingroomNo", meetingroomNo);
	    parameters.put("date", date);
	    return sst.selectList("meetingroom.getReservedTimes", parameters);
	}

	@Override
	public List<MeetingroomReservationVo> reserveTimeList(SqlSessionTemplate sst, String meetingroomNo, String date) {
		
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("meetingroomNo", meetingroomNo);
	    parameters.put("date", date);
	    
		return sst.selectList("meetingroom.reserveTimeList", parameters);
	}

	@Override
	public int checkTime(SqlSessionTemplate sst, String meetingroomNo, String date, String startTime) {
		
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("meetingroomNo", meetingroomNo);
	    parameters.put("date", date);
	    parameters.put("startTime", startTime);
		
		return sst.selectOne("meetingroom.checkTime", parameters);
	}

	@Override
	public int addReserveInfoToCalendar(SqlSessionTemplate sst, MeetingroomReservationVo mrv) {
		return sst.insert("meetingroom.addReserveInfoToCalendar", mrv);
	}

	@Override
	public int checkReserve(SqlSessionTemplate sst, MeetingroomReservationVo mrv) {
		return sst.selectOne("meetingroom.checkReserve", mrv);
	}

	@Override
	public int mtStop(SqlSessionTemplate sst, String no) {
		return sst.update("meetingroom.mtStop", no);
	}

	@Override
	public int mtNormal(SqlSessionTemplate sst, String no) {
		return sst.update("meetingroom.mtNormal", no);
	}

	@Override
	public List<MeetingroomReservationVo> selectReserveList(SqlSessionTemplate sst, String userNo) {
		return sst.selectList("meetingroom.selectReserveList", userNo);
	}

	@Override
	public int unReserve(SqlSessionTemplate sst, String resNo) {
		return sst.update("meetingroom.unReserve", resNo);
	}

	@Override
	public int unCalendar(SqlSessionTemplate sst, String resNo, String resDateTime) {
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("resNo", resNo);
	    parameters.put("resDateTime", resDateTime);
		return sst.update("meetingroom.unCalendar", parameters);
	}


}
