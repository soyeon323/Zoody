package com.kh.zoody.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.employee.service.EmployeeService;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("employee")
@RequiredArgsConstructor
public class EmployeeController {
	private final EmployeeService es;
	
	//직원등록 화면
	@GetMapping("enroll")
	public void enroll() {}
	
	//직원등록
	@PostMapping("enroll")
	public String enroll(UserVo vo) {
		int result = es.enroll(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		
		return "redirect:list";
	}
	
	//직원상세조회 및 수정 화면
	@GetMapping("detail")
	public void detail() {}
	
	//직원상세조회 및 수정
	
	//직원목록 화면
	@GetMapping("list")
	public void list() {}
	
	//직원목록 
}
