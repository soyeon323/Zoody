package com.kh.zoody.error.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class errorPageController {
	
	@RequestMapping("/error-page/404")
    public String error404(HttpServletRequest req, HttpServletResponse resp) {
		log.info("errorPage 404");
        printErrorInfo(req);
        return "error/404page";
    }

    @RequestMapping("/error-page/500")
    public String error500(HttpServletRequest req, HttpServletResponse resp) {
    	log.info("errorPage 500");
        printErrorInfo(req);
        return "error/500page";
    }
    
    @RequestMapping("/error-page/error")
    public String error(HttpServletRequest req, HttpServletResponse resp) {
    	log.info("errorPage error");
        printErrorInfo(req);
        return "error/errorPage";
    }

    private void printErrorInfo(HttpServletRequest req) {
		log.info("dispatchTypes= {}", req.getDispatcherType());
    }

}
