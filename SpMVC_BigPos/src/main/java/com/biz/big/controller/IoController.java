package com.biz.big.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/io")
public class IoController {

	@RequestMapping(value = "/list/in")
	public String inlist(Model model) {
		model.addAttribute("BODY", "IO_IN_LIST");
		return "home";
	}

	@RequestMapping(value = "/list/out")
	public String outlist(Model model) {
		model.addAttribute("BODY", "IO_OUT_LIST");
		return "home";
	}

	@RequestMapping(value = "/detail")
	public String detail(Model model) {
		return "io/io_detail";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Model model) {
		return "io/io_input";
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
		return "io/io_input";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update() {
		return "redirect:/io/list";
	}

}
