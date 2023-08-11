package com.kh.zoody.meetingroom.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.meetingroom.vo.MeetingroomReservationVo;
import com.kh.zoody.meetingroom.vo.MeetingroomVo;

public interface MeetingroomService {

	List<MeetingroomVo> selectList();

	int addMeetingroom(MeetingroomVo mvo, MultipartFile file);

	int mtDelete(String no);

	MeetingroomVo selectDetail(String no);

	int updateMeetingroom(MeetingroomVo mvo, MultipartFile file);

	List<Map<String, Object>> reserveTime(String meetingroomNo, String date);

	int addReserve(MeetingroomReservationVo mrv);

	List<String> getReservedTimes(String meetingroomNo, String date);

	List<MeetingroomReservationVo> reserveTimeList(String meetingroomNo, String date);

	int checkTime(String meetingroomNo, String date, String startTime);

	int addReserveInfoToCalendar(MeetingroomReservationVo mrv);

	int checkReserve(MeetingroomReservationVo mrv);

	int mtStop(String no);

	int mtNormal(String no);

	List<MeetingroomReservationVo> selectReserveList(String userNo);

	int unReserve(String resNo);

	int unCalendar(String resNo, String resDateTime);


}
