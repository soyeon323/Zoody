package com.kh.zoody.approval.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;

import com.google.gson.Gson;
import com.kh.zoody.addressbook.service.AddressBookSerivce;
import com.kh.zoody.approval.service.ApprovalService;

@Controller
@RequestMapping("approval")
@RequiredArgsConstructor
public class ApprovalController {
	
	private final ApprovalService approvalService;
	private final AddressBookSerivce addressbookService;
	private final Gson gson = new Gson();

	@GetMapping("main-page")
	public String mainPage() {
		return "approval/main-page";
	}
	
//	@GetMapping("write/letter-of-approval")
//	public String writeLetterOfApproval(Model model) {
//		List<DepartmentVo> departmentList = addressbookService.getDepartmentList();
//		List<UserVo> userList = addressbookService.getUserList();
//		
//		model.addAttribute("departmentList", departmentList);
//		model.addAttribute("userList", userList);
//		
//		return "approval/write/letter-of-approval";
//	}
	
	@GetMapping("write/{category}")
	public String writeApproval(@PathVariable String category, Model model) {
		String documentForm = approvalService.getDocumentForm(category);
		
		List<DepartmentVo> departmentList = addressbookService.getDepartmentList();
		List<UserVo> userList = addressbookService.getUserList();
		
		model.addAttribute("documentForm", documentForm);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("userList", userList);
		
		return "approval/write";
	}
	
	
	@GetMapping(value="loginmember", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getLoginMemberInSession(HttpSession session, HttpServletResponse resp) {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		
		String loginMemberJson = gson.toJson(loginMember);
		
		return loginMemberJson;
	}
	
	@GetMapping("temp")
	public String temp() {
		return "approval/write/temp";
	}
	
	
}
