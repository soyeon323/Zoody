package com.kh.zoody.employee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	//직원등록
	@Override
	public int enroll(SqlSessionTemplate sst, UserVo vo) {
		return sst.insert("user.enroll", vo);
	}

	//직원상세조회
	@Override
	public UserVo detail(SqlSessionTemplate sst, String id) {
		return sst.selectOne("user.detail", id);
	}

	//직원목록
	@Override
	public List<UserVo> list(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("user.list", searchMap, rb);
	}

	//페이징처리를 위한 게시글 갯수 조회
	@Override
	public int getEmployeeListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("user.getEmployeeListCnt", searchMap);
	}

	//직원정보수정
	@Override
	public int edit(SqlSessionTemplate sst, UserVo vo) {
		return sst.update("user.edit", vo);
	}


}
