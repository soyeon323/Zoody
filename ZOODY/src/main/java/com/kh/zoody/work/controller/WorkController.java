package com.kh.zoody.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zoody.work.service.WorkService;
import com.kh.zoody.work.vo.WorkVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("work")
@RequiredArgsConstructor
@Slf4j
public class WorkController {

	private final WorkService ws;
	
	//업무할당 화면  
	@GetMapping("work")
	public String work(Model m , HttpServletRequest req , WorkVo vo) {
		
//		HttpSession session = req.getSession();
//		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
//		
//		List<WorkVo> wvo = ws.workList(loginMember);
//		log.info("vo : {}",wvo);
//		
//		if(vo ==null) {
//			throw new RuntimeException();
//		}
//		m.addAttribute("loginMember" , loginMember);
//		m.addAttribute("vo",wvo);
		
		return "work/work";
	}
	
//	업무 추가 버튼을 눌러서 업무명 , 업무내용 , 마감날짜 추가  AJAX 
	@PostMapping("insert")
	@ResponseBody
	public String workInsert( WorkVo vo , HttpServletRequest req) {
	    String[] checkListNameArr = req.getParameterValues("checkListName");
	    String checkListName = "";
	    
	    if (checkListNameArr != null) {
	    	checkListName = String.join(",", checkListNameArr); // 여러 개의 업무 이름을 쉼표로 구분하여 문자열로 합침
	    }
	    
	    vo.setCheckListName(checkListName); // 합쳐진 업무 이름을 VO 객체에 설정
	    
	    int result = ws.workInsert(vo);
	    if (result != 2) {
	        throw new RuntimeException();
	    }
	    return "ok";
	}

	
//	업무명과 마감일시 가져오기 AJAX로
	@PostMapping(value =  "view" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getWorkNameAndDate(Model m , String userNo , HttpServletResponse resp) {
		
		List<WorkVo> vo = ws.getWorkNameAndDate(userNo);
		
		if(vo ==null) {
			throw new RuntimeException();
		}
		Gson gson = new Gson();
		String data = gson.toJson(vo);
		log.info(data);
		return data;
	}	
	
	//모달창을 눌러 해당 업무 상세 조회
	@PostMapping(value = "detail" , produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String getWorkDetail(WorkVo vo) {
		
		WorkVo wvo = ws.getWorkDetail(vo);
		log.info("getWorkDetail / wwv = {}" , wvo);
		if(wvo ==null) {
			throw new RuntimeException();
		}
		Gson gson = new Gson();
		String data = gson.toJson(wvo);
		return data;
	}
	
}