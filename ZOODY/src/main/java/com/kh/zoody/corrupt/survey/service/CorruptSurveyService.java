package com.kh.zoody.corrupt.survey.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.corrupt.survey.dao.CorruptSurveyDao;
import com.kh.zoody.survey.vo.SurveyVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;

import java.util.List;

import javax.websocket.server.ServerEndpoint;

@Service
@Transactional
@RequiredArgsConstructor
public class CorruptSurveyService {

	
	private final SqlSessionTemplate sst;
	private final CorruptSurveyDao dao;
	
	//설문조사 문항 가져오기
	public List<SurveyVo> getSurveyQuestion() {
		return dao.getSurveyQuestion(sst);
	}

	//설문 조사 평균화면
	public SurveyVo avgScore(String score) {
		return dao.avgSocre(sst,score);
	}

	//설문조사 마치고 합산점수 가져가기
	public int increaseScore(String score, UserVo loginMember ) {
		
		//설문조사 후 참여여부를 o 로 바꾸는 메소드
		int result = dao.updateStatus(sst,loginMember);
		
		int avgScore  = 0;
		if(result ==1) {
			//설문조사 마치고 합산점수 가져가기
			avgScore = dao.increaseScore(sst,score);
		}
		
		return avgScore;
	}

	//참여자의 설문조사 참가여부 가져오기(X)
	public SurveyVo getjoinStatus(UserVo loginMember) {
		return dao.getjoinStatus(sst,loginMember);
	}

}
