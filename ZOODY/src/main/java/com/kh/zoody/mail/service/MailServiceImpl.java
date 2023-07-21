package com.kh.zoody.mail.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.mail.dao.MailDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MailServiceImpl implements MailService{
	
	private SqlSessionTemplate sqlSessionTemplate;
	private MailDao mailDao;

}
