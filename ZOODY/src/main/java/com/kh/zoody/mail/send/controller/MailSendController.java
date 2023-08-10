package com.kh.zoody.mail.send.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zoody.pwd.controller.MailSendService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("mail")
@RequiredArgsConstructor
@Slf4j
public class MailSendController {
	
	private final MailSendService mailService;
	
	//이메일 인증
	@GetMapping("email")
	@ResponseBody
	public String mailCheck(String email) {
		log.info("이메일 인증 요청이 들어옴!");
		log.info("이메일 인증 이메일 : {}" ,email);
		
		return mailService.joinEmail(email);
	}

}
