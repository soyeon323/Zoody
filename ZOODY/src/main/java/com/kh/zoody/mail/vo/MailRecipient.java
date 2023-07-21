package com.kh.zoody.mail.vo;

import lombok.Data;

@Data
public class MailRecipient {
	
	private String mailNo;
	private String receiverEmail;
	private String readCheck;
	private String bookmarkCheck;
	private String deleteCheck;
}
