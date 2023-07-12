package com.kh.zoody.guidance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("guidance")
public class GuidanceController {

	@GetMapping("guidance")
	public void guidance() {}
}
