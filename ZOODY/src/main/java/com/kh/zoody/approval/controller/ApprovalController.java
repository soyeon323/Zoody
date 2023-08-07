package com.kh.zoody.approval.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zoody.department.vo.DepartmentVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import com.google.gson.Gson;
import com.kh.zoody.addressbook.service.AddressBookSerivce;
import com.kh.zoody.approval.service.ApprovalService;
import com.kh.zoody.approval.vo.ApplicationForLeave;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;

@Controller
@RequestMapping("approval")
@RequiredArgsConstructor
@Slf4j
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
	
	@PostMapping("write")
	public String writeApproval(
			@RequestParam List<String> approver,
			@RequestParam(required=false) List<String> cc,
			@RequestParam String drafter,
			@RequestParam String title, 
			@RequestParam String categoryNo,
			// 품의서
			@RequestParam(required=false) String content,
			// 휴가 신청서
			@RequestParam(required=false) String startDate,
			@RequestParam(required=false) String endDate,
			@RequestParam(required=false) String leaveTypeNo,
			@RequestParam(required=false) String reason
			// 지출결의서
			// 휴일,연장 근무 신청서
			) {
		
		ApprovalVo approvalVo = new ApprovalVo();
		approvalVo.setDrafter(drafter);
		approvalVo.setTitle(title);
		approvalVo.setCategoryNo(categoryNo);
		
		int result = 0 ;
		if("1".equals(categoryNo)) {
			result = approvalService.writeLOA(approvalVo, approver, cc, content);
		} else if ("2".equals(categoryNo)) {
			ApplicationForLeave afl = new ApplicationForLeave();
			afl.setTypeNo(leaveTypeNo);
			afl.setFrom(startDate.replaceAll("[-]", ""));
			afl.setTo(endDate.replaceAll("[-]", ""));
			afl.setReason(reason);
			result = approvalService.writeAFL(approvalVo, approver, cc, afl);
		}
		
		
		return "";
	}
	
	
	
	@GetMapping(value="loginmember", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getLoginMemberInSession(HttpSession session, HttpServletResponse resp) {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		
		String loginMemberJson = gson.toJson(loginMember);
		
		return loginMemberJson;
	}
	
	@GetMapping(value="ltype", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getLeaveType() {
		List<LeaveTypeVo> leaveTypeList = approvalService.getLeaveType();
		
		String leaveTypeListJson = gson.toJson(leaveTypeList);
		
		return leaveTypeListJson;
	}
	
	
	
	@GetMapping("temp")
	public String temp() {
		return "approval/write/temp";
	}
	
	
}
