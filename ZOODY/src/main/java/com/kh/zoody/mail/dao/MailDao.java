package com.kh.zoody.mail.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.mail.vo.MailRecipientVo;
import com.kh.zoody.mail.vo.MailVo;
import com.kh.zoody.user.vo.UserVo;

public interface MailDao {

	// 메일 보내기
	int sendMail(
			List<String> receiverEmailAddress, 
			List<String> ccEmailAddress, 
			List<String> bccEmailAddress,
			List<MultipartFile> attachmentFileList, 
			MailVo mailVo, 
			SqlSessionTemplate sqlSessionTemplate);
	
	
	// 모든 메일 가져오기( 읽은거 안읽은거 받은거 참조인거 )
	List<MailVo> getAllMail(String mail, SqlSessionTemplate sqlSessionTemplate);
	
	
	// 받은 메일 가져오기 (참조 제외)
	List<MailVo> getReceiveMail(String receiverEmail, SqlSessionTemplate sqlSessionTemplate);

	
	// 보낸 메일 가져오기
	List<MailVo> getSendMail(String mail, SqlSessionTemplate sqlSessionTemplate);
	
	
	// 나에게 쓴 메일 가져오기
	List<MailVo> getToMeMail(String mail, SqlSessionTemplate sqlSessionTemplate);
	
	
	// 메일 번호로 메일 상세 정보 가져오기
	MailVo getMailDetailByNo(String no, SqlSessionTemplate sqlSessionTemplate);
	// 상세보기한 메일 읽음 체크
	int readCheck(Map<String, String> readMail, SqlSessionTemplate sqlSessionTemplate);
	
	
	// 메일 번호의 받는 사람들 가져오기
	List<UserVo> getMailRecipientByMailNo(String no, SqlSessionTemplate sqlSessionTemplate);

	
	// 메일 번호의 참조인 가져오기
	List<UserVo> getMailCcByMailNo(String no, SqlSessionTemplate sqlSessionTemplate);

	
	// 메일 리스트 읽음 처리
	int mailListReadCheck(List<Map<String, String>> selectedToReadMailNoList, SqlSessionTemplate sqlSessionTemplate);


	// 메일 리스트 삭제
	int mailListDump(List<Map<String, String>> selectedToDumpMailNoList, SqlSessionTemplate sqlSessionTemplate);

	

}
