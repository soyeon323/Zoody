package com.kh.zoody.mail.vo;

import lombok.Data;

@Data
public class MailRecipientVo {
	
	private String mailNo;
	private String receiverNo;
	private String readCheck;
	private String bookmarkCheck;
	private String deleteCheck;

}
