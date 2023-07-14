package com.kh.zoody.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mail")
public class MailController {

	@GetMapping("folder/receive")
	public String mailList() {
		
		return "mail/folder/receive";
	}
	
	@GetMapping("write")
	public String mailWrite() {
		
		return "mail/write";
	}
	
	@GetMapping("detail")
	public String mailDetail(String no) {
		
		return "mail/detail";
	}
	
}
