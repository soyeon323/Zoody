package com.kh.zoody.mail.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.dao.MailDao;
import com.kh.zoody.mail.vo.MailAttachmentVo;
import com.kh.zoody.mail.vo.MailBoxVo;
import com.kh.zoody.mail.vo.MailRecipientVo;
import com.kh.zoody.mail.vo.MailVo;
import com.kh.zoody.user.vo.UserVo;

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
			List<MailAttachmentVo> mailAttachmentVoList, 
			MailVo mailVo) {
		
		return mailDao.sendMail(
				receiverEmailAddress,
				ccEmailAddress, 
				bccEmailAddress,
				mailAttachmentVoList, 
				mailVo,
				sqlSessionTemplate
				);
		
	}
	
	
	// 모든 메일 가져오기( 읽은거 안읽은거 받은거 참조인거 )
	@Override
	public List<MailVo> getAllMail(String mail) {
		return mailDao.getAllMail(mail, sqlSessionTemplate);
	}
	
	// 안읽은 메일 갯수
	@Override
	public String getUnreadMailCount(String mail) {
		return mailDao.getUnreadMailCount(mail, sqlSessionTemplate);
	}


	// 모든 메일 갯수
	@Override
	public String getAllMailCount(String mail) {
		return mailDao.getAllMailCount(mail, sqlSessionTemplate);
	}
	
	
	// 받은 메일 가져오기 (참조 제외)
	@Override
	public List<MailVo> getReceiveMail(String receiverEmail){
		return mailDao.getReceiveMail(receiverEmail, sqlSessionTemplate);
	}
	
	// 보낸 메일 가져오기
	@Override
	public List<MailVo> getSendMail(String mail) {
		return mailDao.getSendMail(mail, sqlSessionTemplate);
	}

	
	// 나에게 쓴 메일 가져오기
	@Override
	public List<MailVo> getToMeMail(String mail){
		return mailDao.getToMeMail(mail, sqlSessionTemplate);
	}
	
	// 메일 번호의 메일 상세 정보 가져오기
	@Override
	public MailVo getMailDetailByNo(String no) {
		return mailDao.getMailDetailByNo(no, sqlSessionTemplate);
	}
	// 상세보기한 메일 읽음 체크
	@Override
	public int readCheck(Map<String, String> readMail) {
		return mailDao.readCheck(readMail, sqlSessionTemplate);
	}

	
	// 메일 번호의 받는 사람들 가져오기
	@Override
	public List<UserVo> getMailRecipientByMailNo(String no) {
		return mailDao.getMailRecipientByMailNo(no, sqlSessionTemplate);
	}

	
	// 메일 번호의 참조인 가져오기
	@Override
	public List<UserVo> getMailCcByMailNo(String no) {
		return mailDao.getMailCcByMailNo(no, sqlSessionTemplate);
	}

	
	// 메일 리스트 읽음 처리
	@Override
	public int mailListReadCheck(List<Map<String, String>> selectedToReadMailNoList) {
		return mailDao.mailListReadCheck(selectedToReadMailNoList, sqlSessionTemplate);
	}
	
	
	// 메일 리스트 삭제
	@Override
	public int mailListDump(List<Map<String, String>> selectedToDumpMailNoList) {
		return mailDao.mailListDump(selectedToDumpMailNoList, sqlSessionTemplate);
	}


	// 첨부파일 가져오기
	@Override
	public List<MailAttachmentVo> getMailAttachmentListByMailNo(String no) {
		return mailDao.getMailAttachmentListByNo(no, sqlSessionTemplate);
	}


	// 휴지통 메일 리스트 가져오기
	@Override
	public List<MailVo> getDumpMail(String mail) {
		return mailDao.getDumpMail(mail, sqlSessionTemplate);
	}


	// 중요 메일 리스트 가져오기
	@Override
	public List<MailVo> getBookmarkMail(String mail) {
		return mailDao.getBookmarkMail(mail, sqlSessionTemplate);
	}


	// 중요 체크하기
	@Override
	public int addBookmark(Map<String, String> dataMap) {
		return mailDao.addBookmark(dataMap, sqlSessionTemplate);
	}


	// 받은 메일 총 갯수
	@Override
	public String getAllReceiveMailCnt(String mail) {
		return mailDao.getAllReceiveMailCnt(mail, sqlSessionTemplate);
	}


	// 중요 체크해제
	@Override
	public int removeBookmark(Map<String, String> dataMap) {
		return mailDao.removeBookmark(dataMap, sqlSessionTemplate);
	}


	// 메일함 생성
	@Override
	public int createFolder(Map<String, String> dataMap) {
		return mailDao.createFolder(dataMap, sqlSessionTemplate);
	}


	// 메일함 가져오기
	@Override
	public List<MailBoxVo> getMailBoxList(String no) {
		return mailDao.getMailBoxList(no, sqlSessionTemplate);
	}


	// 메일함 삭제
	@Override
	public int deleteFolder(String no) {
		return mailDao.deleteFolder(no, sqlSessionTemplate);
	}


	// 받은 메일 중 안읽은 메일
	@Override
	public String getUnreadReceiveMailCnt(String mail) {
		return mailDao.getUnreadReceiveMailCnt(mail, sqlSessionTemplate);
	}


	// 보낸 메일 갯수
	@Override
	public String getAllSendMailCnt(String mail) {
		return mailDao.getAllSendMailCnt(mail, sqlSessionTemplate);
	}


	// 내게 보낸 메일 갯수
	@Override
	public String getAllToMeMailCnt(String mail) {
		return mailDao.getAllToMeMailCnt(mail, sqlSessionTemplate);
	}

	// 안 읽은 내게 보낸 메일 갯수
	@Override
	public String getUnreadToMeMailCnt(String mail) {
		return mailDao.getUnreadToMeMailCnt(mail, sqlSessionTemplate);
	}

	// 삭제한 메일 갯수
	@Override
	public String getDumpMailCnt(String mail) {
		return mailDao.getDumpMailCnt(mail, sqlSessionTemplate);
	}

	// 삭제한 메일 중 안읽은 메일 갯수
	@Override
	public String getUnreadDumpMailCnt(String mail) {
		return mailDao.getUnreadDumpMailCnt(mail, sqlSessionTemplate);
	}

	// 중요 메일 갯수
	@Override
	public String getUnreadBookMarkMailCnt(String mail) {
		return mailDao.getUnreadBookMarkMailCnt(mail, sqlSessionTemplate);
	}

	// 안읽은 중요 메일 갯수
	@Override
	public String getBookMarkMailCnt(String mail) {
		return mailDao.getBookMarkMailCnt(mail, sqlSessionTemplate);
	}

	// 메일들 안읽음 처리
	@Override
	public int mailListUnread(List<Map<String, String>> selectedToUnreadMailList) {
		return mailDao.mailListUnread(selectedToUnreadMailList, sqlSessionTemplate);
	}

}
