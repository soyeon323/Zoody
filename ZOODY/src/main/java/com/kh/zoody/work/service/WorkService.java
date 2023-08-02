package com.kh.zoody.work.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.user.vo.UserVo;
import com.kh.zoody.work.dao.WorkDao;
import com.kh.zoody.work.vo.WorkVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class WorkService {
	
	private final WorkDao dao;
	private final SqlSessionTemplate sst;
	
	//업무 추가 버튼을 눌러서 업무명 , 업무내용 , 마감날짜 추가
	public int workInsert(WorkVo vo) {
		int result = dao.workInsert(sst, vo);
		if(result !=2) {
			throw new RuntimeException();
		}
		return result;
	}

	//업무할당 화면  회원들 가져와서 뿌려줘야함
	public List<WorkVo> workList(UserVo loginMember) {
		return dao.workList(sst , loginMember);
	}

	// 업무명과 마감일시 가져오기 AJAX로
	public List<WorkVo> getWorkNameAndDate(String userNo) {
		return dao.getWorkNameAndDate(sst , userNo);
	}
	
	
}
