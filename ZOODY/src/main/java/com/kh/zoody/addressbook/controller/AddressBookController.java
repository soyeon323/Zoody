package com.kh.zoody.addressbook.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.addressbook.service.AddressBookSerivce;
import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("addressbook")
@RequiredArgsConstructor
@Slf4j
public class AddressBookController {
	
	private final AddressBookSerivce addressbookService;
	
	@GetMapping("main-page")
	public String mainPage(Model model) {
		
		List<DepartmentVo> departmentList = addressbookService.getDepartmentList();
		List<UserVo> userList = addressbookService.getUserList();
		
		log.info("DepartmentList : {}", departmentList);
		log.info("UserList : {}", userList);
		
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("userList", userList);
		
		return "addressbook/main-page";
	}
	
}
