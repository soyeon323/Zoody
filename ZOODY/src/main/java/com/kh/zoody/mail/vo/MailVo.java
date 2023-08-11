package com.kh.zoody.mail.vo;

import lombok.Data;

@Data
public class MailVo {

	private String no;
	private String sender;
	private String prevNo;
	private String mailboxNo;
	private String title;
	private String content;
	private String sendDate;
	
	private String senderName;
	private String senderMail;
	
	private String readCheck;
	private String readCheck2;
	private String deleteCheck;
	private String bookmarkCheck;
	private String receiverNo;
	private String mailAttachmentCnt;
}
