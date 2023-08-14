package com.kh.zoody.home.service;

import java.util.List;
import java.util.Map;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.home.vo.HomeCalendarVo;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.user.vo.UserVo;

public interface HomeService {

	List<NoticeVo> getNewNotice();

	AttendanceVo getHomeAttendanceList(int loginMemberNo);

	List<BoardVo> newBoardList();

	List<HomeCalendarVo> getCalendar(int loginMemberNo);

	int updateUserInfo(UserVo vo);

	UserVo getUpdateUserInfo(UserVo vo);

	List<NoticeVo> getNewEventNotice();

	List<BoardVo> newBoardList(Map<String, String> searchMap);
}
