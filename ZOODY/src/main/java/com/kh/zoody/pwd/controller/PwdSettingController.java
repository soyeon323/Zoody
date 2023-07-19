package com.kh.zoody.pwd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("pwd/setting")
public class PwdSettingController {

	@GetMapping
	public String pwdSetting() {
		return "pwd/setting";
	}
}
