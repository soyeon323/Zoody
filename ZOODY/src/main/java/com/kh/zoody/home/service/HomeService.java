package com.kh.zoody.home.service;

import java.util.List;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.notice.vo.NoticeVo;

public interface HomeService {

	List<NoticeVo> getNewNotice();

	AttendanceVo getHomeAttendanceList(int loginMemberNo);

	List<BoardVo> newBoardList();

}
