package com.kh.zoody;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = {"/","home","main"})
public class HomeController {
	
	@GetMapping
	public String home() {
		return "home";
	}
	
}
