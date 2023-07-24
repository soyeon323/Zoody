package com.kh.zoody.animal.service;

import org.springframework.transaction.annotation.Transactional;

import com.kh.zoody.animal.dao.AnimalDao;
import com.kh.zoody.animal.health.vo.HealthVo;
import com.kh.zoody.animal.training.vo.TrainingVo;
import com.kh.zoody.animal.vo.AnimalVo;
import com.kh.zoody.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

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
	
	//동물 목록 조회
	public List AnimalList(PageVo pv) {
		return dao.AnimalList(sst,pv);
	}

	//동물 리스트 조회(총 갯수)
	public int getAnimalListCnt() {
		return dao. getAnimalListCnt(sst);
	}

	//동물 훈련 일지 작성
	public int trainingWrite(TrainingVo vo) {
		return dao.trainingWrite(sst,vo);
	}

	//동물 건강 상태 작성
	public int healthWrite(HealthVo vo) {
		return dao.healthWrite(sst, vo);
	}

	//동물 상세 조회
	public AnimalVo animalDetail(AnimalVo vo) {
		return dao.animalDetail(sst,vo);
	}

	//동물 건강 상태 조회
	public HealthVo animalHealth(AnimalVo vo) {
		return dao.animalHealth(sst,vo);
	}
}
