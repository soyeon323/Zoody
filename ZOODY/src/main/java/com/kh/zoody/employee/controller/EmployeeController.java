package com.kh.zoody.employee.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zoody.constpool.ConstPool;
import com.kh.zoody.employee.service.EmployeeService;
import com.kh.zoody.page.vo.PageVo;
import com.kh.zoody.user.vo.UserVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("employee")
@RequiredArgsConstructor
public class EmployeeController {
	private final EmployeeService es;
	
	//직원등록 화면
	@GetMapping("enroll")
	public void enroll() {}
	
	//직원등록
	@PostMapping("enroll")
	public String enroll(UserVo vo, MultipartFile f, HttpServletRequest req) throws Exception {
		int result = es.enroll(vo);
		
		if(result != 1 && f.isEmpty()) {
			throw new RuntimeException();
		}
		
		String savePath = req.getServletContext().getRealPath("/resources/img/employee/");
	    String originalFilename = f.getOriginalFilename();
	    String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	    String fileName = UUID.randomUUID().toString() + extension;
	    String path = savePath + fileName;
	    File target = new File(path);
		
		f.transferTo(target);
		
		return "redirect:list";
	}
	
	//직원상세조회 및 수정 화면
	@GetMapping("detail")
	public void detail() {}
	
	//직원상세조회 및 수정
	
	//직원목록 화면
	@GetMapping("list")
	public String list(Integer page, Model model) {
		
		int listCount = es.getEmployeeListCnt();
		int currentPage = (page != null) ? page : 1;
		int pageLimit = ConstPool.PAGE_LIMIT;
		int boardLimit = ConstPool.BOARD_LIMIT;
		
		//페이징처리
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		int EmployeListCnt = es.getEmployeeListCnt();
		
		List<UserVo> voList = es.list(pv);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("voList", voList);
		map.put("EmployeListCnt", EmployeListCnt);

		model.addAttribute("map", map);
		
		return "employee/list";
	}
	
}
