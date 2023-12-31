package com.kh.zoody.approval.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.kh.zoody.approval.vo.ApplicationForExtraWorkVo;
import com.kh.zoody.approval.vo.ApplicationForLeaveVo;
import com.kh.zoody.approval.vo.ApprovalVo;
import com.kh.zoody.approval.vo.ApproverVo;
import com.kh.zoody.approval.vo.DrafterVo;
import com.kh.zoody.approval.vo.ExtraWorkCategoryVo;
import com.kh.zoody.approval.vo.LeaveTypeVo;
import com.kh.zoody.approval.vo.LetterOfApprovalVo;

@Controller
@RequestMapping("approval")
@RequiredArgsConstructor
@Slf4j
public class ApprovalController {
	
	private final ApprovalService approvalService;
	private final AddressBookSerivce addressbookService;
	private final Gson gson = new Gson();

	@GetMapping("list")
	public String mainPage(HttpSession session, Model model, @RequestParam(defaultValue="1") String category) {
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			return "redirect:/member/login";
		}
		
		String userNo = loginMember.getNo();
		
		List<ApprovalVo> approvalVoList = new ArrayList<>();
		
		if("1".equals(category)) {
			approvalVoList = approvalService.getApprovalList(userNo);
		} else if("2".equals(category)) {
			approvalVoList = approvalService.getStandbyList(userNo);
		} else if("3".equals(category)) {
			approvalVoList = approvalService.getCCList(userNo);
		} else if("4".equals(category)) {
			approvalVoList = approvalService.getUpvoteList(userNo);
		}
		
		String Cnt1 = approvalService.getCat1Ctn(userNo);
		String Cnt2 = approvalService.getCat2Ctn(userNo);
		String Cnt3 = approvalService.getCat3Ctn(userNo);
		String Cnt4 = approvalService.getCat4Ctn(userNo);
		
		model.addAttribute("approvalVoList", approvalVoList);
		
		model.addAttribute("receiveCnt", Cnt1);
		model.addAttribute("standbyCtn", Cnt2);
		model.addAttribute("ccCtn", Cnt3);
		model.addAttribute("upvoteCnt", Cnt4);
		
		return "approval/list";
	}
	
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
			@RequestParam(required=false) String reason,
			// 지출결의서
			@RequestParam(required=false) String extraWorkCategoryNo,
			@RequestParam(required=false) String date,
			@RequestParam(required=false) String startTime,
			@RequestParam(required=false) String endTime,
			@RequestParam(required=false) String extraWorkReason
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
			
			ApplicationForLeaveVo afl = new ApplicationForLeaveVo();
			afl.setTypeNo(leaveTypeNo);
			afl.setFrom(startDate.replaceAll("[-]", ""));
			afl.setTo(endDate.replaceAll("[-]", ""));
			afl.setReason(reason);
			
			result = approvalService.writeAFL(approvalVo, approver, cc, afl);
			
		} else if ("3".equals(categoryNo)) {
			
			ApplicationForExtraWorkVo afe = new ApplicationForExtraWorkVo();
			afe.setCategoryNo(extraWorkCategoryNo);
			afe.setDate(date.replaceAll("[-]", ""));
			afe.setStartTime(startTime.replaceAll("[:]", ""));
			afe.setEndTime(endTime.replaceAll("[:]", ""));
			afe.setReason(extraWorkReason);
			
			result = approvalService.writeAFE(approvalVo, approver, cc, afe);
		}
		
		
		return "redirect:/approval/list?category=4";
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
	
	@GetMapping(value="wtype", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getWorkType() {
		List<ExtraWorkCategoryVo> workTypeList = approvalService.getWorkType();
		
		String workTypeListJson = gson.toJson(workTypeList);
		
		return workTypeListJson;
	}
	
	@GetMapping("detail")
	public String approvalDetail(String no, Model model) {
		
		ApprovalVo approvalVo = approvalService.getApprovalDetail(no);
		
		model.addAttribute("approvalVo", approvalVo);
		
		return "approval/detail";
	}
	
	@GetMapping(value="detail/drafter", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getDrafterInfo(String no) {
		
		DrafterVo drafterVo = approvalService.getDrafterInfo(no);
		
		String drafter = gson.toJson(drafterVo);
		
		return drafter;
	}
	
	@GetMapping(value="detail/category", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getCateogoryNo(String no) {
		
		String categoryNo = approvalService.getCategory(no);
		
		return categoryNo;
	}
	
	@GetMapping(value="detail/loa", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getLoaDetail(String no) {
		
		LetterOfApprovalVo loaVo = approvalService.getLoaInfo(no);
		
		String loaInfo = gson.toJson(loaVo);
		
		return loaInfo;
	}
	
	@GetMapping(value="detail/afl", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getAflDetail(String no) {
		
		ApplicationForLeaveVo aflVo = approvalService.getAflInfo(no);
		
		String aflInfo = gson.toJson(aflVo);
		
		return aflInfo;
	}
	
	@GetMapping(value="detail/afe", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getAfEDetail(String no) {
		
		ApplicationForExtraWorkVo afeVo = approvalService.getAfEDetail(no);
		
		String afeInfo = gson.toJson(afeVo);
		
		return afeInfo;
	}
	
	@GetMapping(value="detail/approvers", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getApprovers(String no) {
		
		List<ApproverVo> approverVoList = approvalService.getApprovers(no);
		
		String approves = gson.toJson(approverVoList);
		
		return approves;
	}
	
	@GetMapping(value="detail/cc", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getCC(String no) {
		
		List<ApproverVo> ccList = approvalService.getCc(no);
		
		String cc = gson.toJson(ccList);
		
		return cc;
	}
	
	@PostMapping("detail/approve")
	@ResponseBody
	public String diciseApproval(@RequestBody String data, HttpSession session) {
		
		Map<String, String> dataMap = gson.fromJson(data, Map.class);
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
		dataMap.put("userNo", loginMember.getNo());
		
		Map<String, String> resultMap = approvalService.deciseApproval(dataMap);
		
		String resultMapJson = gson.toJson(resultMap);
		
		return resultMapJson;
	}
	
	
	@GetMapping("temp")
	public String temp() {
		return "approval/write/temp";
	}
	
	
}
