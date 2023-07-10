package com.kh.zoody.addressbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("addressbook")
public class AddressBookController {
	
	@GetMapping("main-page")
	public String mainPage() {
		
		return "addressbook/main-page";
	}
	
}
