package com.biz.big.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/dept")
public class DeptController {

	@RequestMapping(value = "/list")
	public String list(Model model) {
		
		model.addAttribute("BODY","DEPT-LIST");
		return "home";
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Model model) {
		
		model.addAttribute("BODY","DEPT-INPUT");
		return "home";
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input() {
		return "redirect:/dept/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model) {
		
		model.addAttribute("BODY","DEPT-DETAIL");
		return "home";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		return "redirect:/dept/list";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model) {
		
		model.addAttribute("BODY","DEPT-INPUT");
		return "home";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update() {
		return "redirect:/dept/list";
	}
	
}
