package com.kh.zoody.animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("animal")
public class AnimalController {

	//동물 등록
	@GetMapping("enroll")
	public void animalEnroll() {}
	
	
	//동물 상세 조회
	@GetMapping("detail")
	public void animalDetail() {}
	
}
