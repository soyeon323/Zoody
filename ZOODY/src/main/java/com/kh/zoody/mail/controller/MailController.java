package com.kh.zoody.mail.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.service.MailService;
import com.kh.zoody.mail.vo.MailRecipientVo;
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

	@GetMapping("list")
	public String mailList(HttpSession session, Model model, String folder) {
		
		UserVo loginUser = (UserVo) session.getAttribute("loginMember");
		
		List<MailVo> mailVoList = new ArrayList<>();
		if("receive".equals(folder)) {
			mailVoList = mailService.getReceiveMail(loginUser.getMail());
		}
		
		model.addAttribute(mailVoList);
		
		return "mail/list";
	}
	
	@GetMapping("write")
	public String mailWrite() {
		
		return "mail/write";
	}
	
	@GetMapping("detail")
	public String mailDetail(String no, Model model) {
		
		MailVo detailMailVo = mailService.getMailDetailByNo(no);
		
		List<UserVo> recipientUserVoList = mailService.getMailRecipientByMailNo(no);
		
		List<UserVo> ccUserVoList = mailService.getMailCcByMailNo(no);
		
		model.addAttribute("detailMailVo", detailMailVo);
		model.addAttribute("recipientUserVoList", recipientUserVoList);
		model.addAttribute("ccUserVoList", ccUserVoList);
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
		
		return "redirect:/mail/list?folder=receive";
	}
	
	@PostMapping("img/upload")
	public void uploadImg (MultipartFile file, HttpServletRequest req, HttpServletResponse resp) {
		
		if(file.isEmpty()) {
			throw new RuntimeException("파일 비어있음.");
		}
		
		String savePath = req.getServletContext().getRealPath("/resources/mail/upload/img/");
		
		String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String newImgName = UUID.randomUUID() + ext;
		
		String path = savePath + newImgName;
		File target = new File(path);
		
		
		String root = req.getContextPath();
		try {
			file.transferTo(target);
			
			resp.getWriter().write(root + "/resources/mail/upload/img/" + newImgName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}