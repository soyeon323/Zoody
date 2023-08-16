package com.kh.zoody.corrupt.survey.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zoody.survey.vo.SurveyVo;
import com.kh.zoody.user.vo.UserVo;

@Repository
public class CorruptSurveyDao {

	//설문조사 문항 가져오기
	public List<SurveyVo> getSurveyQuestion(SqlSessionTemplate sst) {
		return sst.selectList("survey.getSurveyQuestion");
	}

	//설문조사 평균화면
	public SurveyVo avgSocre(SqlSessionTemplate sst, String score) {
		return sst.selectOne("survey.avgSocre",score);
	}

	//설문조사 마치고 합산점수 가져가기
	public int increaseScore(SqlSessionTemplate sst, String score) {
		return sst.insert("survey.increaseScore",score);
	}

	//참여자의 설문 조사 참여 여부 가져오기
	public SurveyVo getjoinStatus(SqlSessionTemplate sst, UserVo loginMember) {
		return sst.selectOne("survey.getjoinStatus" , loginMember);
	}

	//설문조사 후 참여여부를 o 로 바꾸는 메소드
	public int updateStatus(SqlSessionTemplate sst, UserVo loginMember) {
		return sst.update("survey.updateStatus" , loginMember);
	}

}
