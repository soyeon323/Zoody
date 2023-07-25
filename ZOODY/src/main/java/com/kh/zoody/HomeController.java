package com.kh.zoody;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zoody.community.service.CommuityService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = {"/","home","main"})
@RequiredArgsConstructor
public class HomeController {
	
	private final CommuityService cs;
	
	@GetMapping
	public String home(Model model) {
		
		cs.getBoardListByCount(5);
		
		return "home";
	}
	
}
