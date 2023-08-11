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

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.zoody.mail.service.MailService;
import com.kh.zoody.mail.vo.MailAttachmentVo;
import com.kh.zoody.mail.vo.MailBoxVo;
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
		String mailCount = "";
		
		List<MailVo> mailVoList = new ArrayList<>();
		if("all".equals(folder)) {
			unread = mailService.getUnreadMailCount(loginUser.getMail());
			mailCount = mailService.getAllMailCount(loginUser.getMail());
			mailVoList = mailService.getAllMail(loginUser.getMail());
		} else if("receive".equals(folder)) {
			unread = mailService.getUnreadReceiveMailCnt(loginUser.getMail());
			mailCount = mailService.getAllReceiveMailCnt(loginUser.getMail());
			mailVoList = mailService.getReceiveMail(loginUser.getMail());
		} else if("send".equals(folder)) {
			mailCount = mailService.getAllSendMailCnt(loginUser.getMail());
			mailVoList = mailService.getSendMail(loginUser.getMail());
		} else if("to-me".equals(folder)) {
			unread = mailService.getUnreadToMeMailCnt(loginUser.getMail());
			mailCount = mailService.getAllToMeMailCnt(loginUser.getMail());
			mailVoList = mailService.getToMeMail(loginUser.getMail());
		} else if("dump".equals(folder)) {
			unread = mailService.getUnreadDumpMailCnt(loginUser.getMail());
			mailCount = mailService.getDumpMailCnt(loginUser.getMail());
			mailVoList = mailService.getDumpMail(loginUser.getMail());
		} else if("bookmark".equals(folder)) {
			unread = mailService.getUnreadBookMarkMailCnt(loginUser.getMail());
			mailCount = mailService.getBookMarkMailCnt(loginUser.getMail());
			mailVoList = mailService.getBookmarkMail(loginUser.getMail());
		}
		
		List<MailBoxVo> mailBoxList = mailService.getMailBoxList(loginUser.getNo());
		
		model.addAttribute("unread", unread);
		model.addAttribute("mailCount", mailCount);
		model.addAttribute("mailVoList", mailVoList);		
		model.addAttribute("mailBoxList", mailBoxList);
		
		return "mail/list";
	}
	
	@GetMapping("write")
	public String mailWrite(HttpSession session, Model model) {
		UserVo loginUser = (UserVo) session.getAttribute("loginMember");
		
		String unread = mailService.getUnreadMailCount(loginUser.getMail());
		
		List<MailBoxVo> mailBoxList = mailService.getMailBoxList(loginUser.getNo());
		
		model.addAttribute("unread", unread);
		model.addAttribute("mailBoxList", mailBoxList);
		
		return "mail/write";
	}
	
	@GetMapping("detail")
	public String mailDetail(String no, Model model, HttpSession session) {
		UserVo loginUser = (UserVo) session.getAttribute("loginMember");
		
		String unread = mailService.getUnreadMailCount(loginUser.getMail());
		String mailCount = mailService.getAllMailCount(loginUser.getMail());
		
		MailVo detailMailVo = mailService.getMailDetailByNo(no);
		
		List<MailAttachmentVo> mailAttachmentVoList = mailService.getMailAttachmentListByMailNo(no);
		
		List<UserVo> recipientUserVoList = mailService.getMailRecipientByMailNo(no);
		
		List<UserVo> ccUserVoList = mailService.getMailCcByMailNo(no);
		
		List<MailBoxVo> mailBoxList = mailService.getMailBoxList(loginUser.getNo());
		
		model.addAttribute("unread", unread);
		model.addAttribute("mailCount", mailCount);
		model.addAttribute("mailBoxList", mailBoxList);
		
		model.addAttribute("detailMailVo", detailMailVo);
		model.addAttribute("mailAttachmentVoList", mailAttachmentVoList);
		model.addAttribute("recipientUserVoList", recipientUserVoList);
		model.addAttribute("ccUserVoList", ccUserVoList);
		return "mail/detail";
	}
	@GetMapping("detail/read")
	@ResponseBody
	public String readCheck(String no, HttpSession session, HttpServletResponse resp) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		String userMail = loginMember.getMail();
		
		Map<String, String> readMail = new HashMap<>();
		readMail.put("userMail", userMail);
		readMail.put("mailNo", no);
		
		int result = mailService.readCheck(readMail);
		
		return Integer.toString(result);
	}
	
	@GetMapping("download/attachment")
	public ResponseEntity<ByteArrayResource> downloadAttachment(String name, HttpServletRequest req) {
		
		String path = req.getServletContext().getRealPath("/resources/mail/upload/attachment/");
		
		File target = new File(path + name);
		byte[] data = null;
		try {
			data = FileUtils.readFileToByteArray(target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		ByteArrayResource temp = new ByteArrayResource(data);
		
		
		return ResponseEntity
				.ok()			// == statusCode(200)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(target.length())
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + target.getName())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.body(temp)
				;
	}
	
	@PostMapping("send")
	public String mailSend(
			@RequestParam List<String> receiverEmailAddress,
			@RequestParam(required=false) List<String> ccEmailAddress, 
			@RequestParam(required=false) List<String> bccEmailAddress,
			List<MultipartFile> attachmentFileList,
			HttpSession session,
			MailVo mailVo,
			HttpServletRequest req) {
		
		UserVo loginUser = (UserVo) session.getAttribute("loginMember");
		mailVo.setSender(loginUser.getNo());
		
		List<MailAttachmentVo> mailAttachmentVoList = new ArrayList<>();
		if(attachmentFileList.size() > 1) {
			String savePath = req.getServletContext().getRealPath("/resources/mail/upload/attachment/");
			
			for(MultipartFile file : attachmentFileList) {
				MailAttachmentVo mailAttachmentVo = new MailAttachmentVo();
				
				mailAttachmentVo.setOriginName(file.getOriginalFilename());
				
				String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				String changeName = UUID.randomUUID() + ext;
				
				mailAttachmentVo.setChangeName(changeName);
				
				String path = savePath + changeName;
				File target = new File(path);
				
				String root = req.getContextPath();
				try {
					file.transferTo(target);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				mailAttachmentVoList.add(mailAttachmentVo);
			}
		}
		
		int result = mailService.sendMail(
				receiverEmailAddress, 
				ccEmailAddress, 
				bccEmailAddress, 
				mailAttachmentVoList, 
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
	
	
	@PostMapping("selected/unread")
	@ResponseBody
	public String selectedMailUnread(@RequestBody String data, HttpSession session) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		String userMail = loginMember.getMail();
		
		Map<String, Object> dataMap = gson.fromJson(data, Map.class);
		
		List<String> selectedMailNoList = (List<String>) dataMap.get("selectedMailNoArr");
		
		List<Map<String, String>> selectedToUnreadMailList = new ArrayList<>();
		for(int i = 0; i < selectedMailNoList.size(); i++) {
			Map<String, String> tempMap = new HashMap<>();
			tempMap.put("mailNo", selectedMailNoList.get(i));
			tempMap.put("userMail", userMail);
			selectedToUnreadMailList.add(tempMap);
		}
		
		int result = mailService.mailListUnread(selectedToUnreadMailList);
		
		return Integer.toString(result);
	}
	
	
	@PostMapping("selected/dump")
	@ResponseBody
	public String selectedMailDump(@RequestBody String ajaxData, HttpSession session, HttpServletResponse resp) {
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
		
		return Integer.toString(result);
	}
	
	
	
	@GetMapping(value="bookmark/add")
	@ResponseBody
	public String addBookmark(String no, HttpSession session) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("mailNo", no);
		dataMap.put("userMail", loginMember.getMail());
		
		int result = mailService.addBookmark(dataMap);
		
		return Integer.toString(result);
	}
	
	@GetMapping(value="bookmark/remove")
	@ResponseBody
	public String removeBookmark(String no, HttpSession session) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("mailNo", no);
		dataMap.put("userMail", loginMember.getMail());
		
		int result = mailService.removeBookmark(dataMap);
		
		return Integer.toString(result);
	}
	
	
	
	@GetMapping("folder/create")
	@ResponseBody
	public String createFolder(String name, HttpSession session) {
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		
		Map<String, String> dataMap = new HashMap<>();
		
		dataMap.put("userNo", loginMember.getNo());
		dataMap.put("folderName", name);
		
		int result = mailService.createFolder(dataMap);
		
		return Integer.toString(result);
	}
	
	@GetMapping("folder/delete")
	@ResponseBody
	public String deleteFolder(String no) {
		
		int result = mailService.deleteFolder(no);
		
		return Integer.toString(result);
	}
	
}