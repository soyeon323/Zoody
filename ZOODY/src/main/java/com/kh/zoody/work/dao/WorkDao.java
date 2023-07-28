package com.kh.zoody.work.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.work.vo.WorkVo;

@Repository
public class WorkDao {

	//업무 추가 버튼을 눌러서 업무명 , 업무내용 , 마감날짜 추가
	public int workInsert(SqlSessionTemplate sst, Map paramMap) {
		return sst.insert("work.workInsert" , paramMap);
	}

//	// 업무명과 마감일시 가져오기 AJAX로
//	public WorkVo getWorkNameAndDate(SqlSessionTemplate sst) {
//		return sst.selectOne("work.getWorkNameAndDate");
//	}

}
