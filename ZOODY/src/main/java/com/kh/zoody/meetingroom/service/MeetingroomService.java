package com.kh.zoody.meetingroom.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.meetingroom.vo.MeetingroomVo;

public interface MeetingroomService {

	List<MeetingroomVo> selectList();

	int addMeetingroom(MeetingroomVo mvo, MultipartFile file, HttpServletRequest req);

	int mtDelete(String no);

	MeetingroomVo selectDetail(String no);

	int updateMeetingroom(MeetingroomVo mvo, MultipartFile file);


}
