package com.kh.zoody.corrupt.survey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("corrupt")
public class CorruptSurveyController {

	@GetMapping("survey")
	public String corruptSurvey() {
		return "survey/corrupt";
	}
	
}
