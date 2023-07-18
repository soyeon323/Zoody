package com.kh.zoody.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("project")
@RequiredArgsConstructor
public class ProjectController {

	//참여중인 프로젝트 화면
	@RequestMapping("progress")
	public void projectInProgress() {}
	
	//프로젝트 상세화면
	@RequestMapping("detail")
	public void detail() {}
}
