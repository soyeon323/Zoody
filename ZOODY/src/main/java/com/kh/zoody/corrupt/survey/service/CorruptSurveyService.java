package com.kh.zoody.corrupt.survey.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.corrupt.survey.dao.CorruptSurveyDao;
import com.kh.zoody.survey.vo.SurveyVo;

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
}
