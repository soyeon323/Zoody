package com.kh.zoody.corrupt.survey.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.survey.vo.SurveyVo;

@Repository
public class CorruptSurveyDao {

	//설문조사 문항 가져오기
	public List<SurveyVo> getSurveyQuestion(SqlSessionTemplate sst, SurveyVo vo) {
		return sst.selectList("survey.getSurveyQuestion",vo);
	}

}
