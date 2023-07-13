package com.kh.zoody.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("attendance")
public class AttendanceController {
	
	@GetMapping("workStatus")
	public String workStatus() {
		return "attendance/workStatus";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "attendance/detail";
	}
	
	@GetMapping("admin")
	public String objection() {
		return "attendance/objection";
	}
	
	@GetMapping("admin/objection")
	public String adminObjection(){
		return "attendance/adminObjection";
	}

}
