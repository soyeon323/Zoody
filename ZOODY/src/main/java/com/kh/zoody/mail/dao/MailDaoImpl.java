package com.kh.zoody.mail.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.vo.MailRecipient;
import com.kh.zoody.mail.vo.MailVo;

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
		
		int insertMailResult = sqlSessionTemplate.insert("mail.insertMail", mailVo);
		
		if(attachmentFileList.size() > 1) {
			insertMailResult *= sqlSessionTemplate.insert("mail.insertAttachment", attachmentFileList);			
		} 
		
		List<MailRecipient> mailRecipientVoList = new ArrayList<>();
		for (String receiverEmail : receiverEmailAddress) {
			MailRecipient mailRecipientVo = new MailRecipient();
			mailRecipientVo.setMailNo(mailVo.getNo());
			mailRecipientVo.setReceiverEmail(receiverEmail);
			mailRecipientVoList.add(mailRecipientVo);
		}
		int insertMailRecipientResult = sqlSessionTemplate.insert("mail.insertRecipient", mailRecipientVoList);
		
		if(ccEmailAddress != null) {
			insertMailResult *= sqlSessionTemplate.insert("mail.insert");
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
	

}
