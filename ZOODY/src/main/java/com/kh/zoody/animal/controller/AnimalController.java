package com.kh.zoody.animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.animal.service.AnimalService;
import com.kh.zoody.animal.vo.AnimalVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("animal")
@RequiredArgsConstructor
@Slf4j
public class AnimalController {

	private final AnimalService as;
	
	//동물 등록
	@GetMapping("enroll")
	public String animalEnroll() {
		return "animal/enroll";
	}
	
	//동물 등록
	@PostMapping("enroll")
	public String animalEnroll(AnimalVo vo) {
		
		int result = as.animalEnroll(vo);
		
		if(result !=1) {
			throw new RuntimeException();
		}
		return "animal/list";
	}
	
	
	//동물 상세 조회
	@GetMapping("detail")
	public String animalDetail() {
		return "animal/detail";
	}
	
	//동물 건강 상태 조회
	@GetMapping("health")
	public String animalHealth() {
		return "animal/health";
	}
	
	//동물 훈련 일지 작성
	@GetMapping("training")
	public String animalTraining() {
		return "animal/training";
	}
	
	//동물 리스트
	@GetMapping("list")
	public String animalList() {
		return "animal/list";
	}
	
	//동물 건강 상태 작성
	@GetMapping("health/write")
	public String animalHealthWrite() {
		return "animal/health-write";
	}
	
	
}
