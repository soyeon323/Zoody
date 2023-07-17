package com.kh.zoody.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("document")
@RequiredArgsConstructor
@Slf4j
public class DocumentController {
	
	// 개인 문서 화면
	@GetMapping()
	public String privateDocument(Model model) {
		model.addAttribute("documentType", "private");
		return "document/document";
	}
	
	// 전사 문서 화면
	@GetMapping("enterpriseDocument")
	public String enterpriseDocument(Model model) {
		model.addAttribute("documentType", "enterprise");
		return "document/document";
	}
	
	
	
}
