package com.kh.zoody.error.controller;

import java.lang.System.Logger;
import java.util.NoSuchElementException;

import org.apache.ibatis.javassist.NotFoundException;
import org.mybatis.logging.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.ServerErrorException;

import com.kh.zoody.attendance.controller.AttendanceController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@ControllerAdvice(annotations = Controller.class)
@Slf4j
public class ExceptionHandlerController {
	
	
	// 모든 Exception 핸들러 정의
	
	@ExceptionHandler(Exception.class)
	public String exception() {
		
        return "error/errorPage";
	}
	
	// 404 Error Code 반환
	@ExceptionHandler(NotFoundException.class)
	public String exceptionNotFount() {
		
		return "error/404page";
	}
	
	
	// 500 Error Code 반환 : 서버 에러
	@ExceptionHandler(ServerErrorException.class)
	public String exceptionServerError() {
		
		return "error/505page";
	}
	

}
