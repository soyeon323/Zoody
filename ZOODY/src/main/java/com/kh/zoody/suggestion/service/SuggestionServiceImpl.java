package com.kh.zoody.suggestion.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.suggestion.dao.SuggestionDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class SuggestionServiceImpl implements SuggestionService{
	private final SuggestionDao dao;
	private final SqlSessionTemplate sst;
}
