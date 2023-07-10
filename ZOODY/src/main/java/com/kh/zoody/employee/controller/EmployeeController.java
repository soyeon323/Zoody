package com.kh.zoody.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("employee")
public class EmployeeController {

	//직원등록 화면
	@GetMapping("enroll")
	public void enroll() {}
	
	//직원등록
	
	//직원상세조회 및 수정 화면
	@GetMapping("detail")
	public void detail() {}
	
	//직원상세조회 및 수정
	
}
