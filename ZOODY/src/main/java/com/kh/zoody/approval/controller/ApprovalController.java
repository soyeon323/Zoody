package com.kh.zoody.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("approval")
public class ApprovalController {

	@GetMapping("main-page")
	public String mainPage() {
		return "approval/main-page";
	}
	
	@GetMapping("write/letter-of-approval")
	public String writeLetterOfApproval() {
		return "approval/write/letter-of-approval";
	}
	
}
