package com.kh.zoody.project;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.zoody.project.service.ProjectService;
import com.kh.zoody.project.vo.ProjectVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("project")
@RequiredArgsConstructor
@Slf4j
public class ProjectController {
	private final ProjectService ps;

	//참여중인 프로젝트 화면
	@RequestMapping("progress")
	public void projectInProgress(Model model) {
		List<ProjectVo> voList = ps.selectUser();
		
		if(voList == null) {
			throw new RuntimeException();
		}
		model.addAttribute("voList", voList);
	}
	
	//프로젝트 상세화면
	@RequestMapping("detail")
	public void detail() {}
}
