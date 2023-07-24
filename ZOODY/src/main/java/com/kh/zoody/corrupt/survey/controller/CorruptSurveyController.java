package com.kh.zoody.corrupt.survey.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.corrupt.survey.service.CorruptSurveyService;
import com.kh.zoody.survey.vo.SurveyVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("corrupt")
@RequiredArgsConstructor
public class CorruptSurveyController {
	
	private final CorruptSurveyService css;

	@RequestMapping("survey")
	public String corruptSurvey(SurveyVo vo ,Model m) {
		
		List<SurveyVo> svo = css.getSurveyQuestion(vo);
		
		if(vo == null) {
			throw new RuntimeException();
		}
		
		m.addAttribute("vo",vo);
		return "survey/corrupt";
	}
	
	//설문조사 평균 점수 화면
	@GetMapping("survey/score")
	public String corruptServeyAverage() {
		return "survey/corrupt-average";
	}
	
}
