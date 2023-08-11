package com.kh.zoody;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
			HttpServletRequest req) {
    	
    	HttpSession session = req.getSession();
		
		int loginMemberNo = 0;
		
		if (session.getAttribute("loginMember") == null) {
			return "redirect:/member/login";
	    }
		
		
		UserVo loginMember = (UserVo) session.getAttribute("loginMember");
        loginMemberNo = Integer.parseInt(loginMember.getNo());
    	
    	String call = "home";
    	
        List<BoardVo> boardList = cs.getBoardListByCount(call);
        List<BoardVo> newBoardList = hs.newBoardList();
        List<NoticeVo> getNotice = hs.getNewNotice();
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

}
