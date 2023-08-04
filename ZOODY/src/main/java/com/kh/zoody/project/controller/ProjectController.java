package com.kh.zoody.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.project.service.ProjectService;
import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectVo;
import com.kh.zoody.suggestion.vo.SuggestionVo;

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
		List<ProjectVo> prjList = ps.prjData();
		
		if(voList == null) {
			throw new RuntimeException();
		}

		log.info("prjList : {}", prjList);
		
		model.addAttribute("voList", voList);
		model.addAttribute("prjList", prjList);
	}
	
	@PostMapping("progress")
	@ResponseBody
	public List<ProjectVo> projectProgress(@RequestBody String str, Model model) {
		Gson gson = new Gson();
		ProjectAllVo paVo = gson.fromJson(str, ProjectAllVo.class);
		
		//프로젝트 테이블에 내용 insert
		int result1 = ps.insertPrj(paVo);
		
		//insert한 프로젝트 테이블의 no 가져오기
		String pjNo = ps.selectPjNo(paVo.getTeamName());
		
		//userNo이랑 paVo 뭉치기
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", paVo.getUserNo());
		map.put("pjNo", pjNo);
				
		// 생성된 플젝 번호 가져온뒤 플젝멤버 insert 
        int result2 = 0;
        List<String> userNoList = (List<String>) paVo.getUserNo();
        for (String userNo : userNoList) {
            map.put("userNo", userNo);
            result2 += ps.insertPrjMember(map);
        }
        
        //프로젝트 다 생성됐으면 화면으로 넘겨줄 데이터 가져오기
        List<ProjectVo> pjVoInfo = ps.selectPj(pjNo);

		if(result1 != 1 || result2 == 0) {
			throw new RuntimeException();
		}
		return pjVoInfo;
	}
	
	//프로젝트 상세화면
	@GetMapping("detail")
	public void detail(Model model) {
		List<NoticeVo> noticeList = ps.getNoticeList(new PageVo(4, 1, 1, 4));
		List<SuggestionVo> suggestionList = ps.getSuggestionList(new PageVo(4, 1, 1, 4));
		
		if(noticeList == null) {
			throw new RuntimeException();
		}
			
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("suggestionList", suggestionList);
	}
	
	@PostMapping("detail")
	public void detail() {
		
	}
}
