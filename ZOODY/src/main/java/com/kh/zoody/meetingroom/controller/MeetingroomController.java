package com.kh.zoody.meetingroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("meetingroom")
public class MeetingroomController {
	
	@GetMapping("reserve")
	public String reserve() {
		return "meetingroom/reserve";
	}
	
	@GetMapping("add")
	public String add() {
		return "meetingroom/add";
	}

}
