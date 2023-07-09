package com.kh.zoody.employee.enroll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("employee")
public class EmployeeEnrollController {

	@GetMapping("enroll")
	public void enroll() {}
}
