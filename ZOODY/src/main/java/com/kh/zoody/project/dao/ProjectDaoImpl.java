package com.kh.zoody.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectTodoVo;
import com.kh.zoody.project.vo.ProjectVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	//프로젝트 생성 유저 불러오기
	@Override
	public List<ProjectVo> selectUser(SqlSessionTemplate sst) {
		return sst.selectList("project.selectUser");
	}

	//프로젝트 팀 생성
	@Override
	public int insertPrj(SqlSessionTemplate sst, ProjectAllVo paVo) {
		return sst.insert("project.insertPrj", paVo);
	}

	//프로젝트 팀 번호 가져오기
	@Override
	public String selectPjNo(SqlSessionTemplate sst, String teamName) {
		return sst.selectOne("project.selectPjNo", teamName);
	}

	//프로젝트 멤버 insert
	@Override
	public int insertPrjMember(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("project.insertPrjMember", map);
	}

	//팀 생성 전에 팀명 중복되는지 확인
	@Override
	public List<String> selectTeamName(SqlSessionTemplate sst) {
		return sst.selectList("project.selectTeamName");
	}

	//화면으로 넘겨줄 프로젝트 정보
	@Override
	public List<ProjectVo> selectPj(SqlSessionTemplate sst, String pjNo) {
		return sst.selectList("project.selectPj", pjNo);
	}

	//공지사항 화면 보여주기
	@Override
	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("project.getNoticeList", null, rb);
	}

	//건의사항 화면 보여주기
	@Override
	public List<SuggestionVo> getSuggestionList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("project.getSuggestionList", null, rb);
	}

	//프로젝트 정보 가져오기
	@Override
	public List<ProjectVo> prjData(SqlSessionTemplate sst) {
		return sst.selectList("project.prjData");
	}

	//프로젝트 삭제
	@Override
	public int prjDelete(SqlSessionTemplate sst, String no) {
		return sst.delete("project.prjDelete", no);
	}

	//프로젝트 멤버 삭제
	@Override
	public int prjMemberDelete(SqlSessionTemplate sst, String no) {
		return sst.delete("project.prjMemberDelete", no);
	}

	//프로젝트 번호 가져오기
	@Override
	public List<ProjectVo> getByPrjNo(SqlSessionTemplate sst, String title) {
		return sst.selectList("project.getByPrjNo", title);
	}

	//플젝 제목 가져오기
	@Override
	public String getTitle(SqlSessionTemplate sst, String no) {
		return sst.selectOne("project.getTitle", no);
	}

	//할일 DB에 저장
	@Override
	public int insertTodo(SqlSessionTemplate sst, Map<String, String> todoMap) {
		return sst.insert("project.insertTodo", todoMap);
	}

	//할일 목록 보여주기
	@Override
	public List<ProjectTodoVo> selectTodo(SqlSessionTemplate sst, String no) {
		return sst.selectList("project.selectTodo", no);
	}

	//할일 삭제
	@Override
	public int todoDelete(SqlSessionTemplate sst, String no) {
		return sst.delete("project.todoDelete", no);
	}

	//프로젝트 참여한 멤버no 가져오기
	@Override
	public List<String> selectUserNo(SqlSessionTemplate sst, String no) {
		return sst.selectList("project.selectUserNo", no);
	}

}