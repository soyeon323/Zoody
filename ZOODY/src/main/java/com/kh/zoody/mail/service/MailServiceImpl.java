package com.kh.zoody.mail.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.dao.MailDao;
import com.kh.zoody.mail.vo.MailVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class MailServiceImpl implements MailService{
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	private final MailDao mailDao;
	
	// 메일 보내기
	@Override
	public int sendMail(
			List<String> receiverEmailAddress, 
			List<String> ccEmailAddress, 
			List<String> bccEmailAddress,
			List<MultipartFile> attachmentFileList, 
			MailVo mailVo) {
		
		return mailDao.sendMail(
				receiverEmailAddress,
				ccEmailAddress, 
				bccEmailAddress,
				attachmentFileList, 
				mailVo,
				sqlSessionTemplate
				);
		
	}
	
	// 받은 메일 가져오기 (참조 제외)
	@Override
	public List<MailVo> getReceiveMail(
			String receiverEmail){
		return mailDao.getReceiveMail(receiverEmail, sqlSessionTemplate);
	}

}
