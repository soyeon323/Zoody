package com.kh.zoody.home.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.home.dao.HomeDao;
import com.kh.zoody.home.vo.HomeCalendarVo;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class HomeServiceImpl implements HomeService{
	
	private final HomeDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<NoticeVo> getNewNotice() {
		return dao.getNewNotice(sst);
	}

	@Override
	public AttendanceVo getHomeAttendanceList(int loginMemberNo) {
		return dao.getHomeAttendanceList(sst,loginMemberNo);
	}

	@Override
	public List<BoardVo> newBoardList() {
		return dao.newBoardList(sst);
	}

	@Override
	public List<HomeCalendarVo> getCalendar(int loginMemberNo) {
		return dao.getCalendar(sst,loginMemberNo);
	}

	@Override
	public int updateUserInfo(UserVo vo) {
		return dao.updateUserInfo(sst, vo);
	}
	
	@Override
	public UserVo getUpdateUserInfo(UserVo vo) {
		return dao.getUpdateUserInfo(sst, vo);
	}

	@Override
	public List<NoticeVo> getNewEventNotice() {
		return dao.getNewEventNotice(sst);
	}

	@Override
	public List<BoardVo> newBoardList(Map<String, String> searchMap) {
		return dao.newBoardList(sst,searchMap);
	}


	
}
