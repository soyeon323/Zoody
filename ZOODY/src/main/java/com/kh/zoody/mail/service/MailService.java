package com.kh.zoody.mail.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.vo.MailVo;

public interface MailService {

	// 메일 보내기
	int sendMail(
			List<String> receiverEmailAddress, 
			List<String> ccEmailAddress, 
			List<String> bccEmailAddress,
			List<MultipartFile> attachmentFileList, 
			MailVo mailVo);

	// 받은 메일 가져오기 (참조 제외)
	public List<MailVo> getReceiveMail(
			String receiverEmail);
	
}
