package com.kh.zoody.mail.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("mail")
@RequiredArgsConstructor
@Slf4j
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
	
	@PostMapping("send")
	public String mailSend(String receiverEmailAddress, String ccEmailAddress, String bccEmailAddress, List<MultipartFile> attachmentFileList, String mailTitle, String mailContent) {
		
		log.info("받는사람 : {}", receiverEmailAddress);
		log.info("참조 : {}", ccEmailAddress);
		log.info("숨은참조 : {}", bccEmailAddress);
		
		MultipartFile f = attachmentFileList.get(0);
		log.info("첨부파일 : {}", f);
		
		log.info("제목 : {}", mailTitle);
		log.info("내용 : {}", mailContent);
		
		return "";
	}
	
}
