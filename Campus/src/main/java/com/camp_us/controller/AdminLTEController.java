package com.camp_us.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class AdminLTEController {

	@GetMapping("/student")
	public void starter() {}
	
	@GetMapping("/adminmenu")
		public void adminmenu() {}
	@GetMapping("/empmenu")
		public void empmenu() {}
}