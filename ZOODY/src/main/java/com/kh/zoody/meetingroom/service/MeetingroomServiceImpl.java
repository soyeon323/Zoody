package com.kh.zoody.meetingroom.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.meetingroom.dao.MeetingroomDao;
import com.kh.zoody.meetingroom.vo.MeetingroomVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MeetingroomServiceImpl implements MeetingroomService{
	
	private final MeetingroomDao dao;
	private final SqlSessionTemplate sst;

	@Override
	public List<MeetingroomVo> selectList() {
		return dao.selectList(sst);
	}

	@Override
	public int addMeetingroom(MeetingroomVo mvo) {
		return dao.addMeetingroom(sst, mvo);
	}

	@Override
	public int mtDelete(String no) {
		return dao.mtDelete(sst, no);
	}

	@Override
	public List<MeetingroomVo> selectDetail(String no) {
		return dao.selectDetail(sst, no);
	}

}
