package com.kh.zoody.mail.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.vo.MailCcVo;
import com.kh.zoody.mail.vo.MailRecipientVo;
import com.kh.zoody.mail.vo.MailVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MailDaoImpl implements MailDao {

	// 메일 보내기
	@Override
	public int sendMail(
			List<String> receiverEmailAddress, 
			List<String> ccEmailAddress, 
			List<String> bccEmailAddress,
			List<MultipartFile> attachmentFileList, 
			MailVo mailVo, 
			SqlSessionTemplate sqlSessionTemplate) {
		
		// Mail에 저장.
		int insertMailResult = sqlSessionTemplate.insert("mail.insertMail", mailVo);
		
		// 첨부파일 저장.
		if(attachmentFileList.size() > 1) {
			insertMailResult *= sqlSessionTemplate.insert("mail.insertAttachment", attachmentFileList);			
		}
		
		// 받는사람 저장
		List<MailRecipientVo> mailRecipientVoList = new ArrayList<>();
		for (String receiverEmail : receiverEmailAddress) {
			MailRecipientVo mailRecipientVo = new MailRecipientVo();
			mailRecipientVo.setMailNo(mailVo.getNo());
			mailRecipientVo.setReceiverNo(receiverEmail);
			mailRecipientVoList.add(mailRecipientVo);
		}
		int insertMailRecipientResult = sqlSessionTemplate.insert("mail.insertRecipient", mailRecipientVoList);
		
		// 참조 저장
		if(ccEmailAddress != null) {
			List<MailCcVo> mailCcVoList = new ArrayList<>();
			for (String ccEmail : ccEmailAddress) {
				MailCcVo mailCcVo = new MailCcVo();
				mailCcVo.setMailNo(mailVo.getNo());
				mailCcVo.setCcNo(ccEmail);
				
				// 숨은 참조 체크
				for(String bccEmail : bccEmailAddress) {
					if(ccEmail.equals(bccEmail)) {
						mailCcVo.setBccCheck("O");
						break;
					} else {
						mailCcVo.setBccCheck("X");
					}
				}
				
				mailCcVoList.add(mailCcVo);
			}
			if(ccEmailAddress != null) {
				insertMailResult *= sqlSessionTemplate.insert("mail.insertCc", mailCcVoList);
			}
		}
		
		
		return insertMailResult;
	}
	
	
	// 받은 메일 가져오기 (참조 제외)
	@Override
	public List<MailVo> getReceiveMail(
			String receiverEmail,
			SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getReceiveMailList", receiverEmail);
	}
	

	// 메일 번호로 메일 상세 정보 가져오기
	public MailVo getMailDetailByNo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getMailDetailByNo", no);
	}

	
	// 메일 번호의 받는 사람들 가져오기
	@Override
	public List<UserVo> getMailRecipientByMailNo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("getMailRecipientByMailNo", no);
	}

	
	// 메일 번호의 참조인 가져오기
	@Override
	public List<UserVo> getMailCcByMailNo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("getMailCcByMailNo", no);
	}
	
}
