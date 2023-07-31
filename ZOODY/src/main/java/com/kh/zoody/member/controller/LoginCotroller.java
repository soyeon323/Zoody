package com.kh.zoody.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.login.service.LoginService;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
@Slf4j
public class LoginCotroller {
	
	private final LoginService ls;

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String login(UserVo vo , HttpSession session) {
		
		UserVo loginMember = ls.login(vo);
		if(loginMember == null) {
			throw new RuntimeException();
		}
		session.setAttribute("loginMember", loginMember);
		return "redirect:/home";
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "member/login";
	}
}
