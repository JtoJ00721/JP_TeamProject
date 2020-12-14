package com.biz.big.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/io")
public class IoController {

	@RequestMapping(value = "/list")
	public String list(Model model) {
		model.addAttribute("BODY","IO_LIST");
		return "home";
	}
	
	@RequestMapping(value = "/detail")
	public String detail(Model model) {
		model.addAttribute("BODY","IO_DETAIL");
		return "home";
	}
	
	@RequestMapping(value = "/input",method = RequestMethod.GET)
	public String input(Model model) {
		model.addAttribute("BODY", "IO_INPUT");
		return "home";
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input() {
		return "redirect:/io/list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete() {
		return "redirect:/io/list";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model) {
		model.addAttribute("BODY","IO_INPUT");
		return "home";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update() {
		return "redirect:/io/list";
	}
	
}
