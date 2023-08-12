package com.kh.zoody.mail.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.vo.MailAttachmentVo;
import com.kh.zoody.mail.vo.MailBoxVo;
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
			List<MailAttachmentVo> mailAttachmentVoList, 
			MailVo mailVo, 
			SqlSessionTemplate sqlSessionTemplate) {
		
		
		// Mail에 저장.
		int insertMailResult = sqlSessionTemplate.insert("mail.insertMail", mailVo);
		
		
		// 첨부파일 저장.
		if(mailAttachmentVoList.size() > 1) {
			for(int i = 0; i < mailAttachmentVoList.size(); i++) {
				mailAttachmentVoList.get(i).setMailNo(mailVo.getNo());
			}
			insertMailResult *= sqlSessionTemplate.insert("mail.insertAttachment", mailAttachmentVoList);			
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
				if(bccEmailAddress != null) {
					for(String bccEmail : bccEmailAddress) {
						if(ccEmail.equals(bccEmail)) {
							mailCcVo.setBccCheck("O");
							break;
						} else {
							mailCcVo.setBccCheck("X");
						}
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
	
	
	// 모든 메일 가져오기( 읽은거 안읽은거 받은거 참조인거 )
	@Override
	public List<MailVo> getAllMail(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getAllMail", mail);
	}
	
	// 안읽은 메일 갯수
	@Override
	public String getUnreadMailCount(String mail, SqlSessionTemplate sqlSessionTemplate) {
		
		String resultStr1 = sqlSessionTemplate.selectOne("getUnreadMailCount", mail);
		String reusltStr2 = sqlSessionTemplate.selectOne("getUnreadMailCount2", mail);
		
		int result1 = Integer.parseInt(resultStr1);
		int result2 = Integer.parseInt(reusltStr2);
		
		return Integer.toString(result1 + result2);
	}


	// 모든 메일 갯수
	@Override
	public String getAllMailCount(String mail, SqlSessionTemplate sqlSessionTemplate) {
		
		String resultStr = sqlSessionTemplate.selectOne("getAllMailCount", mail);
		
		int result = Integer.parseInt(resultStr);
		
		
		return Integer.toString(result);
	}
		
	
	// 받은 메일 가져오기 (참조 제외)
	@Override
	public List<MailVo> getReceiveMail(
			String receiverEmail,
			SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getReceiveMailList", receiverEmail);
	}
	
	
	// 나에게 쓴 메일 가져오기
	@Override
	public List<MailVo> getToMeMail(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getToMeMailList", mail);
	}
	
	
	// 보낸 메일 가져오기
	@Override
	public List<MailVo> getSendMail(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getSendMailList", mail);
	}
	

	// 메일 번호로 메일 상세 정보 가져오기
	@Override
	public MailVo getMailDetailByNo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getMailDetailByNo", no);
	}
	// 상세보기한 메일 읽음 체크
	public int readCheck(Map<String, String> readMail, SqlSessionTemplate sqlSessionTemplate) {
		int result = sqlSessionTemplate.update("mail.readCheckRecipient", readMail);
		result += sqlSessionTemplate.update("mail.readCheckCC", readMail);
		return result;
	}

	
	// 메일 번호의 받는 사람들 가져오기
	@Override
	public List<UserVo> getMailRecipientByMailNo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getMailRecipientByMailNo", no);
	}

	
	// 메일 번호의 참조인 가져오기
	@Override
	public List<UserVo> getMailCcByMailNo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getMailCcByMailNo", no);
	}


	// 메일 리스트 읽음 처리
	@Override
	public int mailListReadCheck(List<Map<String, String>> selectedToReadMailNoList, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.update("mail.mailListReadCheck1", selectedToReadMailNoList) + sqlSessionTemplate.update("mail.mailListReadCheck2", selectedToReadMailNoList);
	}


	// 메일 리스트 삭제
	public int mailListDump(List<Map<String, String>> selectedToDumpMailNoList, SqlSessionTemplate sqlSessionTemplate) {
		
		int result = sqlSessionTemplate.update("mail.mailListDump", selectedToDumpMailNoList);
		
		result += sqlSessionTemplate.update("mail.mailListDump2", selectedToDumpMailNoList);
		
		return result;
	}


	// 첨부파일 가져오기
	@Override
	public List<MailAttachmentVo> getMailAttachmentListByNo(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getMailAttachmentListByMailNo", no);
	}


	// 휴지통 메일 리스트 가져오기
	@Override
	public List<MailVo> getDumpMail(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getDumpMailList", mail);
	}


	// 중요 메일 리스트 가져오기
	@Override
	public List<MailVo> getBookmarkMail(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getBookmarkMailList", mail);
	}


	// 중요 체크하기
	@Override
	public int addBookmark(Map<String, String> dataMap, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.update("mail.addBookmark", dataMap);
	}


	// 받은 메일 총 갯수
	@Override
	public String getAllReceiveMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getReceiveMailCnt", mail);
	}

	// 중요 체크해제
	@Override
	public int removeBookmark(Map<String, String> dataMap, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.update("mail.removeBookmark", dataMap);
	}


	// 메일함 생성
	@Override
	public int createFolder(Map<String, String> dataMap, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.insert("mail.createFolder", dataMap);
	}

	// 메일함 가져오기
	@Override
	public List<MailBoxVo> getMailBoxList(String no, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getFolderList", no);
	}

	// 메일함 삭제
	@Override
	public int deleteFolder(String no, SqlSessionTemplate sqlSessionTemplate) {
		
		sqlSessionTemplate.update("mail.deleteMailBoxNoInMail", no);
		
		return sqlSessionTemplate.update("mail.deleteMailBoxByNo", no);
	}


	// 받은 메일 중 안읽은 메일
	@Override
	public String getUnreadReceiveMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getUnreadReceiveMailCnt", mail);
	}


	// 보낸 메일 갯수
	@Override
	public String getAllSendMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getSendMailCnt", mail);
	}

	// 내게 보낸 메일 갯수
	@Override
	public String getAllToMeMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getToMeMailCnt", mail);
	}

	// 안 읽은 내게 보낸 메일 갯수
	@Override
	public String getUnreadToMeMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getUnreadToMeCnt", mail);
	}

	// 삭제한 메일 갯수
	@Override
	public String getDumpMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getDumpMailCnt", mail);
	}

	// 삭제한 메일 중 안읽은 메일 갯수
	@Override
	public String getUnreadDumpMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		
		String resultStr1 = sqlSessionTemplate.selectOne("getUnreadDumpMailCnt1", mail);
		String reusltStr2 = sqlSessionTemplate.selectOne("getUnreadDumpMailCnt2", mail);
		
		int result1 = Integer.parseInt(resultStr1);
		int result2 = Integer.parseInt(reusltStr2);
		
		return Integer.toString(result1 + result2);
	}

	// 중요 메일 갯수
	@Override
	public String getBookMarkMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getBookMarkMailCnt",mail);
	}

	// 안읽은 중요 메일 갯수
	@Override
	public String getUnreadBookMarkMailCnt(String mail, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getUnreadBookMarkCnt",mail);
	}

	// 메일들 안읽음 처리
	@Override
	public int mailListUnread(List<Map<String, String>> selectedToUnreadMailList,
			SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.update("mail.mailListUnreadCheck1", selectedToUnreadMailList) + sqlSessionTemplate.update("mail.mailListUnreadCheck2", selectedToUnreadMailList);
	}


	@Override
	public int mailListMove(List<Map<String, String>> dataList, SqlSessionTemplate sqlSessionTemplate) {
		
		log.info("{}",dataList);
		
		return sqlSessionTemplate.update("mail.moveMailToFolder", dataList);
	}


	@Override
	public List<MailVo> getFolderMail(Map<String, String> dataMap, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("mail.getFolderMailList", dataMap);
	}


	@Override
	public String getUnreadFolderMailCnt(Map<String, String> dataMap, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getFolderUnreadMailListCnt", dataMap);
	}


	@Override
	public String getFolderMailCnt(Map<String, String> dataMap, SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectOne("mail.getFolderMailListCnt", dataMap);
	}
	
	
}
