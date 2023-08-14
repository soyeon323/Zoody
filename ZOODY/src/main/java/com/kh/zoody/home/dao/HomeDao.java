package com.kh.zoody.home.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.home.vo.HomeCalendarVo;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.user.vo.UserVo;

public interface HomeDao {

	List<NoticeVo> getNewNotice(SqlSessionTemplate sst);

	AttendanceVo getHomeAttendanceList(SqlSessionTemplate sst, int loginMemberNo);

	List<BoardVo> newBoardList(SqlSessionTemplate sst);

	List<HomeCalendarVo> getCalendar(SqlSessionTemplate sst, int loginMemberNo);

	int updateUserInfo(SqlSessionTemplate sst, UserVo vo);

	UserVo getUpdateUserInfo(SqlSessionTemplate sst, UserVo vo);

	List<NoticeVo> getNewEventNotice(SqlSessionTemplate sst);

	List<BoardVo> newBoardList(SqlSessionTemplate sst, Map<String, String> searchMap);

}
