package com.kh.zoody.mail.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.service.MailService;
import com.kh.zoody.mail.vo.MailVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("mail")
@RequiredArgsConstructor
@Slf4j
public class MailController {
	
	private final MailService mailService;

	@GetMapping("folder/receive")
	public String mailList(HttpSession session, Model model) {
		
		UserVo loginUser = (UserVo) session.getAttribute("loginMember");
		
		List<MailVo> mailVoList = mailService.getReceiveMail(loginUser.getMail());
		
		model.addAttribute(mailVoList);
		
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
	
	@PostMapping("send")
	public String mailSend(
			@RequestParam List<String> receiverEmailAddress,
			@RequestParam(required=false) List<String> ccEmailAddress, 
			@RequestParam(required=false) List<String> bccEmailAddress,
			List<MultipartFile> attachmentFileList,
			HttpSession session,
			MailVo mailVo) {
		
		UserVo loginUser = (UserVo) session.getAttribute("loginMember");
		mailVo.setSender(loginUser.getNo());
		
		int result = mailService.sendMail(
				receiverEmailAddress, 
				ccEmailAddress, 
				bccEmailAddress, 
				attachmentFileList, 
				mailVo);
		
		return "mail/folder/receive";
	}
	
}