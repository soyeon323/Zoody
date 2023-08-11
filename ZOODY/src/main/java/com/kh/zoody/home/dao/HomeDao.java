package com.kh.zoody.home.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.home.vo.HomeCalendarVo;
import com.kh.zoody.notice.vo.NoticeVo;

public interface HomeDao {

	List<NoticeVo> getNewNotice(SqlSessionTemplate sst);

	AttendanceVo getHomeAttendanceList(SqlSessionTemplate sst, int loginMemberNo);

	List<BoardVo> newBoardList(SqlSessionTemplate sst);

	List<HomeCalendarVo> getCalendar(SqlSessionTemplate sst, int loginMemberNo);

}
