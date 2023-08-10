package com.kh.zoody.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.project.service.ProjectService;
import com.kh.zoody.project.vo.ProjectAllVo;
import com.kh.zoody.project.vo.ProjectTodoVo;
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
		
	  Map<String, List<ProjectVo>> map = new HashMap<>();
	    List<ProjectVo> no1List = new ArrayList<>();
	    List<ProjectVo> no2List = new ArrayList<>();
	    List<ProjectVo> no3List = new ArrayList<>();

	    for (ProjectVo project : prjList) {
	        if (project.getNo().equals("1")) {
	            no1List.add(project);
	        } else if (project.getNo().equals("2")) {
	            no2List.add(project);
	        } else if(project.getNo().equals("3")) {
	        	no3List.add(project);
	        }
	    }
	    map.put("no1List", no1List);
	    map.put("no2List", no2List);
	    map.put("no3List", no3List);
	    
	    model.addAttribute("voList", voList);
	    model.addAttribute("prjList", prjList);
	    model.addAttribute("map", map);
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
	public void detail(String title, Model model, HttpSession session) {
		List<NoticeVo> noticeList = ps.getNoticeList(new PageVo(4, 1, 1, 4));
		List<SuggestionVo> suggestionList = ps.getSuggestionList(new PageVo(4, 1, 1, 4));
		
		//프로젝트 제목으로 번호 조회
		List<ProjectVo> prjVoList = ps.getByPrjNo(title);

		//프로젝트 할일 목록에 추가
		List<ProjectTodoVo> todoList = ps.selectTodo(prjVoList.get(0).getNo());
		
		if(noticeList == null) {
			throw new RuntimeException();
		}
		
		//프로젝트 참여한 멤버no 가져오기
		List<String> noList = ps.selectUserNo(prjVoList.get(0).getNo());
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("suggestionList", suggestionList);
		model.addAttribute("prjVoList", prjVoList);
		model.addAttribute("todoList", todoList);
	}
	
	@PostMapping("detail")
	public String detail(@RequestParam Map<String, String> todoMap, Model model){
		String title = ps.getTitle(todoMap.get("projectNo"));
		
		try {
			title = URLEncoder.encode(title, StandardCharsets.UTF_8.toString());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//할일 DB에 저장
		int result = ps.insertTodo(todoMap);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		
		return "redirect:/project/detail?title=" + title;
	}

	//프로젝트 삭제
	@PostMapping("delete")
	public String delete(String no) {
		int result1 = ps.prjDelete(no);
		int result2 = ps.prjMemberDelete(no);
		
		if(result1 != 1 || result2 != 1) {
			throw new RuntimeException();
		}
		
		return "redirect:/project/progress";
	}
	
	//프로젝트 할일 삭제
	@PostMapping("todo/delete")
	public void todoDelete(String no) {		
		int result = ps.todoDelete(no);
		
		if(result != 1) {
			throw new RuntimeException();
		}
	}
}