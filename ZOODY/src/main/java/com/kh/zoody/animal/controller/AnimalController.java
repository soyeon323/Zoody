package com.kh.zoody.animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("animal")
public class AnimalController {

	@GetMapping("enroll")
	public void animalEnroll() {}
	
}
