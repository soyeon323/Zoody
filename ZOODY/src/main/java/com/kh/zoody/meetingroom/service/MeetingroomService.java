package com.kh.zoody.meetingroom.service;

import java.util.List;

import com.kh.zoody.meetingroom.vo.MeetingroomVo;

public interface MeetingroomService {

	List<MeetingroomVo> selectList();

	int addMeetingroom(MeetingroomVo mvo);

}
