package com.kh.zoody.employee.dao;

import java.util.List;

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

	@Override
	public int edit(SqlSessionTemplate sst, UserVo vo) {
		return 0;
	}

	//직원목록
	@Override
	public List<UserVo> list(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("user.list", null, rb);
	}

	//페이징처리를 위한 게시글 갯수 조회
	@Override
	public int getEmployeeListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("user.getEmployeeListCnt");
	}

}
