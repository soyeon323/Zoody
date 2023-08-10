package com.kh.zoody.pwd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zoody.pwd.service.PwdSettingService;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("pwd")
@RequiredArgsConstructor
@Slf4j
public class PwdSettingController {

	private final PwdSettingService ps;
	
	//비밀번호 설정 뷰 페이지로 이동
	@GetMapping("setting")
	public String pwdSetting() {
		return "pwd/setting";
	}
	
	
	//비밀번호 설정시 AJAX 로 아이디 인증 확인 로직
	@PostMapping("setting")
	@ResponseBody
	public int pwdSetting(UserVo vo) {
		int result = ps.idCheck(vo);
		
		if(result !=1) {
			throw new RuntimeException();
		}
		log.info("resutl : {}" , result);
		
		return result;
	}
	
	//이제 최종 비밀번호 설정 로직 (암호화)
	@PostMapping("pwdSetting")
	public String PwdSetting(UserVo vo , Model m) {
		
		int result = ps.pwdSetting(vo);
		log.info("result :{}",result);
		if(result != 1) {
			throw new RuntimeException();
		}
		m.addAttribute("result",result);
		return "member/login";
	}
	
	
	//비밀번호 찾기 뷰 페이지로 이동
	@GetMapping("find")
	public String pwdFind() {
		return "pwd/find";
	}
}
