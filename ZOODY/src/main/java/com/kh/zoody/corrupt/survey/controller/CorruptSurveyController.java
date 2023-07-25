package com.kh.zoody.corrupt.survey.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.zoody.corrupt.survey.service.CorruptSurveyService;
import com.kh.zoody.survey.vo.SurveyVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("corrupt")
@RequiredArgsConstructor
@Slf4j
public class CorruptSurveyController {
	
	private final CorruptSurveyService css;

	@GetMapping("survey")
	public String corruptSurvey(SurveyVo vo ,Model m) {
		
		List<SurveyVo> svo = css.getSurveyQuestion(vo);
		log.info("svo : {}",svo);
		if(svo == null) {
			throw new RuntimeException();
		}
		
		m.addAttribute("svo",svo);
		return "survey/corrupt";
	}
	
	//설문조사 평균 점수 화면
	@GetMapping("survey/score")
	public String corruptServeyAverage() {
		return "survey/corrupt-average";
	}
	
}
