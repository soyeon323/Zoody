package com.kh.zoody.corrupt.survey.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zoody.corrupt.survey.service.CorruptSurveyService;
import com.kh.zoody.survey.vo.SurveyVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("corrupt")
@RequiredArgsConstructor
@Slf4j
public class CorruptSurveyController {
	
	private final CorruptSurveyService css;

	//설문 조사 화면
	@GetMapping("survey")
	public String corruptSurvey(Model m) {
		
		List<SurveyVo> svo = css.getSurveyQuestion();
		log.info("svo : {}",svo);
		if(svo == null) {
			throw new RuntimeException();
		}
		
		m.addAttribute("svo",svo);
		return "survey/corrupt";
	}
	
	//설문조사 평균 점수 화면
	@GetMapping("survey/score")
	public String corruptServeyAverage(String score , HttpSession session , Model m) {

		UserVo loginMember = (UserVo)session.getAttribute("loginMember");
		
		SurveyVo vo = css.avgScore(score);
		
		//조사참여 여부 가져오기 'X'
		SurveyVo status = css.getjoinStatus(loginMember);
		log.info("status = {}" , status);
		
		m.addAttribute("status" , status);
		m.addAttribute("vo",vo);
		return "survey/corrupt-average";
	
	}
	
	//설문조사 마치고 합산점수 가져가기   
	@PostMapping("survey/score")
	@ResponseBody
	public String corruptServeyAverage(String score , HttpSession session) {
		log.info(score);
		
		UserVo loginMember = (UserVo)session.getAttribute("loginMember");
		log.info(loginMember.getNo()+"surveyScore");
		
		int result = css.increaseScore(score , loginMember);

		if(result !=1) {
			throw new RuntimeException();
		}
		return "redirect:/survey/corrupt-average";
	
	}
	
	
}
