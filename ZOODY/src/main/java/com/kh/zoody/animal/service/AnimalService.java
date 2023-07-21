package com.kh.zoody.animal.service;

import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.animal.dao.AnimalDao;
import com.kh.zoody.animal.vo.AnimalVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class AnimalService {

	private final AnimalDao dao;
	private final SqlSessionTemplate sst;
	
	//동물 등록
	public int animalEnroll(AnimalVo vo) {
		return dao.animalEnroll(sst,vo);
	}
}
