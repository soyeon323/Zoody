package com.kh.zoody.mail.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
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
	
	private final Gson gson = new Gson();

	@GetMapping("list")
	public String mailList(HttpSession session, Model model, String folder) {
		UserVo loginUser = (UserVo) session.getAttribute("loginMember");
		
		String unread = "";
		String allMailCount = "";
		
		unread = mailService.getUnreadMailCount(loginUser.getMail());
		allMailCount = mailService.getAllMailCount(loginUser.getMail());
		
		
		List<MailVo> mailVoList = new ArrayList<>();
		if("all".equals(folder)) {
			mailVoList = mailService.getAllMail(loginUser.getMail());
		} else if("receive".equals(folder)) {
			mailVoList = mailService.getReceiveMail(loginUser.getMail());
		} else if("send".equals(folder)) {
			mailVoList = mailService.getSendMail(loginUser.getMail());
		} else if("to-me".equals(folder)) {
			mailVoList = mailService.getToMeMail(loginUser.getMail());
		} else if("dump".equals(folder)) {
			
		}
		
		model.addAttribute("unread", unread);
		model.addAttribute("allMailCount", allMailCount);
		model.addAttribute("mailVoList", mailVoList);
		
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
	@GetMapping("detail/read")
	public void readCheck(String no, HttpSession session, HttpServletResponse resp) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		String userMail = loginMember.getMail();
		
		Map<String, String> readMail = new HashMap<>();
		readMail.put("userMail", userMail);
		readMail.put("mailNo", no);
		
		int result = mailService.readCheck(readMail);
		
		String resultJson = gson.toJson(result);
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out;
		try {
			out = resp.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
		
		return "redirect:/mail/list?folder=send";
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
	
	
	@PostMapping("selected/read")
	public void selectedMailReadCheck(@RequestBody String ajaxData, HttpSession session, HttpServletResponse resp) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		String userMail = loginMember.getMail();
		
		Map<String, Object> ajaxDataMap = gson.fromJson(ajaxData, HashMap.class);
		
		String folder = (String) ajaxDataMap.get("folder");
		
		List<String> selectedMailNoList = (List<String>) ajaxDataMap.get("selectedMailNoArr");
		
		List<Map<String, String>> selectedToReadMailNoList = new ArrayList<>();
		
		for(int i = 0; i < selectedMailNoList.size(); i++) {
			Map<String, String> tempMap = new HashMap<>();
			tempMap.put("mailNo", selectedMailNoList.get(i));
			tempMap.put("userMail", userMail);
			selectedToReadMailNoList.add(tempMap);
		}
		
		int result = mailService.mailListReadCheck(selectedToReadMailNoList);
		
		try {
			resp.getWriter().write(Integer.toString(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@PostMapping("selected/dump")
	public void selectedMailDump(@RequestBody String ajaxData, HttpSession session, HttpServletResponse resp) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		String userMail = loginMember.getMail();
		
		Map<String, Object> ajaxDataMap = gson.fromJson(ajaxData, HashMap.class);
		
		String folder = (String) ajaxDataMap.get("folder");
		
		List<String> selectedMailNoList = (List<String>) ajaxDataMap.get("selectedMailNoArr");
		
		List<Map<String, String>> selectedToDumpMailNoList = new ArrayList<>();
		
		for(int i = 0; i < selectedMailNoList.size(); i++) {
			Map<String, String> tempMap = new HashMap<>();
			tempMap.put("mailNo", selectedMailNoList.get(i));
			tempMap.put("userMail", userMail);
			selectedToDumpMailNoList.add(tempMap);
		}
		
		int result = mailService.mailListDump(selectedToDumpMailNoList);
		
		try {
			resp.getWriter().write(Integer.toString(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}