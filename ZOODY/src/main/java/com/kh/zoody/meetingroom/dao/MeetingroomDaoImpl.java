package com.kh.zoody.meetingroom.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public List<Map<String, Object>> reserveTime(SqlSessionTemplate sst) {
		return sst.selectList("meetingroom.reserveTime");
	}



}
