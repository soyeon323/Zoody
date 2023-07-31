package com.kh.zoody.project;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.kh.zoody.project.service.ProjectService;
import com.kh.zoody.project.vo.ProjectVo;
import com.kh.zoody.user.vo.PjVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("project")
@RequiredArgsConstructor
@Slf4j
public class ProjectController {
	private final ProjectService ps;

	//참여중인 프로젝트 화면
	@GetMapping("progress")
	public void projectInProgress(Model model) {
		List<ProjectVo> voList = ps.selectUser();
		
		if(voList == null) {
			throw new RuntimeException();
		}
		model.addAttribute("voList", voList);
	}
	
	@PostMapping("progress")
	public void projectProgress(@RequestBody String str) {
		log.info(str);
		Gson gson = new Gson();
		PjVo x = gson.fromJson(str, PjVo.class);
		
		ProjectVo pv = ProjectVo.builder()
						.userNo(x.getUserNo())
						.userName(x.getUserName())
						.title(x.getTitle())
						.content(x.getContent())
						.startDate(x.getStartDate())
						.endDate(x.getEndDate())
						.build();
		
		log.info("pv : {}", pv);
	}
	
	//프로젝트 상세화면
	@RequestMapping("detail")
	public void detail() {
		
	}
}
