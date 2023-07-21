package com.kh.zoody.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.vo.MailVo;

public interface MailDao {

	// 메일 보내기
	int sendMail(
			List<String> receiverEmailAddress, 
			List<String> ccEmailAddress, 
			List<String> bccEmailAddress,
			List<MultipartFile> attachmentFileList, 
			MailVo mailVo, 
			SqlSessionTemplate sqlSessionTemplate);
	
	// 받은 메일 가져오기 (참조 제외)
	List<MailVo> getReceiveMail(
			String receiverEmail,
			SqlSessionTemplate sqlSessionTemplate);

}
