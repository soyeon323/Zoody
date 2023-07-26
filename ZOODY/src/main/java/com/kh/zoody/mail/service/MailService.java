package com.kh.zoody.mail.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.vo.MailRecipientVo;
import com.kh.zoody.mail.vo.MailVo;
import com.kh.zoody.user.vo.UserVo;

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

	
	// 메일 번호의 메일 상세 정보 가져오기
	MailVo getMailDetailByNo(String no);


	// 메일 번호의 받는 사람들 가져오기
	List<UserVo> getMailRecipientByMailNo(String no);


	// 메일 번호의 참조인 가져오기
	List<UserVo> getMailCcByMailNo(String no);
	
}
