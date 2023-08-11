package com.kh.zoody.error.controller;

import java.lang.System.Logger;
import java.util.NoSuchElementException;

import org.mybatis.logging.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.kh.zoody.attendance.controller.AttendanceController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestControllerAdvice(basePackages = "com.zoody")
@Slf4j
@RequiredArgsConstructor
public class ExceptionHandlerController {
	
//	private final Logger logger = LoggerFactory.getLogger();
//	
//	// 모든 Exception 핸들러 정의
//	// 500 Error Code 반환 : 서버 에러
//	@ExceptionHandler(value = AttendanceController.class)
//	public ResponseEntity exception(Exception e) {
//		
//		System.out.println(e.getClass().getName());
//        System.out.println(e.getLocalizedMessage());
//        
//        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Server Error!");
//	}
	
	

}
