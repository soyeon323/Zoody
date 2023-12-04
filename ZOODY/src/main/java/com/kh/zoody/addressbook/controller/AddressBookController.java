//package com.kh.zoody.addressbook.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.google.gson.Gson;
//import com.kh.zoody.addressbook.service.AddressBookSerivce;
//import com.kh.zoody.department.vo.DepartmentVo;
//import com.kh.zoody.user.vo.UserVo;
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//
//@Controller
//@RequestMapping("addressbook")
//@RequiredArgsConstructor
//@Slf4j
//public class AddressBookController {
//	
//	private final AddressBookSerivce addressbookService;
//	
//	private final Gson gson = new Gson();
//	
//	@GetMapping
//	public String mainPage(Model model) {
//		
//		List<DepartmentVo> departmentList = addressbookService.getDepartmentList();
//		List<UserVo> userList = addressbookService.getUserList();
//		
//		model.addAttribute("departmentList", departmentList);
//		model.addAttribute("userList", userList);
//		
//		return "addressbook/main-page";
//	}
//	
//	@GetMapping("detail")
//	public void detailUserInfo(String userNo, HttpServletResponse resp) {
//		
//		UserVo detailUserInfo = addressbookService.getDetailUserInfo(userNo);
//		
//		String jsonDetailUserInfo = gson.toJson(detailUserInfo);
//		
//		try {
//			resp.setCharacterEncoding("UTF-8");
//			
//			PrintWriter out = resp.getWriter();
//			out.write(jsonDetailUserInfo);
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	
//	@GetMapping("search")
//	public void searchUserInfo(String keyword, HttpServletResponse resp) {
//		
//		List<UserVo> resultList = addressbookService.getUserInfoByKeyword(keyword);
//		
//		String jsonResultUserInfoList = gson.toJson(resultList);
//		
//		try {
//			resp.setCharacterEncoding("UTF-8");
//			
//			PrintWriter out = resp.getWriter();
//			out.write(jsonResultUserInfoList);
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	@GetMapping("get/info/brief")
//	public void getBriefUserInfo(String no, HttpServletResponse resp) {
//		
//		UserVo briefInfo = addressbookService.getBriefUserInfo(no);
//		
//		String briefInfoJson = gson.toJson(briefInfo);
//		
//		PrintWriter out;
//		try {
//			resp.setCharacterEncoding("UTF-8");
//			
//			out = resp.getWriter();
//			out.write(briefInfoJson);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//}
