package com.kh.zoody;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zoody.attendance.vo.AttendanceVo;
import com.kh.zoody.community.service.CommuityService;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.home.service.HomeService;
import com.kh.zoody.home.vo.HomeCalendarVo;
import com.kh.zoody.notice.vo.NoticeVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = {"/","home","main"})
@RequiredArgsConstructor
@Slf4j
public class HomeController {
	
	private final CommuityService cs;
	private final HomeService hs;

    @GetMapping
    public String home(Model model, 
			HttpServletRequest req,
			@RequestParam Map<String, String> searchMap, 
			@RequestParam(defaultValue = "4") Integer catNo) {
    	
    	HttpSession session = req.getSession();
		
		int loginMemberNo = 0;
		
		if (session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
	    }
		
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        loginMemberNo = Integer.parseInt(loginMember.getNo());
    	
    	String call = "home";
    	searchMap.put("loginMemberNo", String.valueOf(loginMemberNo));
    	searchMap.put("catNo", String.valueOf(catNo));
    	
    	
        List<BoardVo> boardList = hs.newBoardList(searchMap);
        searchMap.put("all", String.valueOf("all"));
        List<BoardVo> newBoardList = hs.newBoardList(searchMap);
        List<NoticeVo> getNotice = hs.getNewNotice();
        List<NoticeVo> getEventNotice = hs.getNewEventNotice();
        AttendanceVo getAttendance =  hs.getHomeAttendanceList(loginMemberNo);
        List<HomeCalendarVo> getCalendar = hs.getCalendar(loginMemberNo);
        
        if (boardList != null) {
        	log.info("커뮤니티");
        	log.info(boardList+"");
        	model.addAttribute("boardList", boardList);
        }
        if(newBoardList != null) {
        	log.info("최신글");
        	log.info(newBoardList+"");
        	model.addAttribute("newBoardList", newBoardList);
        }
        if (getNotice != null) {
        	log.info("공지");
        	
        	model.addAttribute("getNotice", getNotice);
		}
        if (getEventNotice !=null) {
        	log.info("이벤트 공지");
        	log.info(getEventNotice+"");
        	
        	model.addAttribute("getEventNotice", getEventNotice);
        }
        if(getAttendance != null) {
        	log.info("근태");
        	log.info(getAttendance+"");
        	model.addAttribute("getAttendance", getAttendance);
        }
        if(getCalendar != null) {
        	log.info("일정");
        	log.info(getCalendar+"");
        	model.addAttribute("getCalendar", getCalendar);
        }
       

        
        return "home";
    }
    
    @PostMapping(value = "/updateUserInfo",produces="application/json;charset=UTF-8")
    @ResponseBody
    public String updateUserInfo(UserVo vo,
    		HttpServletRequest req) {
        log.info(vo + "");

        int result = hs.updateUserInfo(vo);
        log.info(result + " result");
        
        if (result != 1) {
            return "error";
        }

        UserVo getUpdateUserInfo = hs.getUpdateUserInfo(vo);
        if (getUpdateUserInfo == null) {
            return "error";
		}

        HttpSession session = req.getSession();

        session.setAttribute("loginMember", getUpdateUserInfo);
        
        Gson gson = new Gson();
        String json = gson.toJson(getUpdateUserInfo); // 객체를 JSON 문자열로 변환

        return json; // JSON 문자열 반환
    }

}
