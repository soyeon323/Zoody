package com.kh.zoody.work.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.user.vo.UserVo;
import com.kh.zoody.work.vo.WorkVo;

@Repository
public class WorkDao {

	//업무 추가 버튼을 눌러서 업무명 , 업무내용 , 마감날짜 추가
	public int workInsert(SqlSessionTemplate sst, WorkVo vo) {
		return sst.insert("work.workInsert" , vo);
	}

	//업무할당 화면  회원들 가져와서 뿌려줘야함
	public List<WorkVo> getUserList(SqlSessionTemplate sst) {
		return sst.selectList("work.getUserList");
	}

	// 업무명과 마감일시 가져오기 AJAX로
	public WorkVo getWorkNameAndDate(SqlSessionTemplate sst) {
		return sst.selectOne("work.getWorkNameAndDate");
	}

}
