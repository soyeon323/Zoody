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

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = {"/","home","main"})
@RequiredArgsConstructor
@Slf4j
public class HomeController {
	
	private final CommuityService cs;


    @GetMapping
    public String home(Model model) {
    	
    	String call = "home";
    	
        List<BoardVo> boardList = cs.getBoardListByCount(call);
        
        model.addAttribute("boardList", boardList);
        
        return "home";
    }

}
