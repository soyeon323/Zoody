package com.kh.zoody.approval.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;

import com.kh.zoody.addressbook.service.AddressBookSerivce;

@Controller
@RequestMapping("approval")
@RequiredArgsConstructor
public class ApprovalController {
	
	private final AddressBookSerivce addressbookService;

	@GetMapping("main-page")
	public String mainPage() {
		return "approval/main-page";
	}
	
	@GetMapping("write/letter-of-approval")
	public String writeLetterOfApproval(Model model) {
		List<DepartmentVo> departmentList = addressbookService.getDepartmentList();
		List<UserVo> userList = addressbookService.getUserList();
		
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("userList", userList);
		
		return "approval/write/letter-of-approval";
	}
	
}
