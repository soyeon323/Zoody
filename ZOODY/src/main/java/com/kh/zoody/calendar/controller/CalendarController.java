package com.kh.zoody.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	
	@GetMapping("month")
	public String month() {
		return "calendar/month";
	}

}
