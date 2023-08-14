package com.kh.zoody.home.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.home.vo.HomeCalendarVo;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class HomeDaoImpl implements HomeDao{

	@Override
	public List<NoticeVo> getNewNotice(SqlSessionTemplate sst) {
		return sst.selectList("home.getNewNotice");
	}

	@Override
	public AttendanceVo getHomeAttendanceList(SqlSessionTemplate sst, int loginMemberNo) {
		return  sst.selectOne("home.getHomeAttendanceList" , loginMemberNo);
	}

	@Override
	public List<BoardVo> newBoardList(SqlSessionTemplate sst) {
		return sst.selectList("home.newBoardList");
	}

	@Override
	public List<HomeCalendarVo> getCalendar(SqlSessionTemplate sst, int loginMemberNo) {
		return sst.selectList("home.getHomeCalendar", loginMemberNo);
	}

	@Override
	public int updateUserInfo(SqlSessionTemplate sst, UserVo vo) {
		return sst.update("home.updateUserInfo", vo);
	}
	
	@Override
	public UserVo getUpdateUserInfo(SqlSessionTemplate sst, UserVo vo) {
		return  sst.selectOne("home.getUpdateUserInfo" , vo);
	}

	@Override
	public List<NoticeVo> getNewEventNotice(SqlSessionTemplate sst) {
		int cat = 3;
		return sst.selectList("home.getNewNotice", cat);
	}

	@Override
	public List<BoardVo> newBoardList(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectList("home.getBoardList", searchMap);
	}
	
}
