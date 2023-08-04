package com.kh.zoody;

import java.util.List;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.zoody.community.service.CommuityService;
import com.kh.zoody.community.vo.BoardVo;
import com.kh.zoody.home.service.HomeService;
import com.kh.zoody.notice.service.NoticeService;
import com.kh.zoody.notice.vo.NoticeVo;

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
    public String home(Model model) {
    	
    	String call = "home";
    	
        List<BoardVo> boardList = cs.getBoardListByCount(call);
        List<NoticeVo> getNotice = hs.getNewNotice();
        
        if (getNotice == null) {
        	log.info("공지 불러오기 실패");
        	return "home";
		}
        log.info(getNotice.get(0).getTitle());
        
        
        model.addAttribute("boardList", boardList);
        model.addAttribute("getNotice", getNotice);
        
        return "home";
    }

}
