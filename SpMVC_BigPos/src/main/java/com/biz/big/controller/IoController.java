package com.biz.big.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.big.model.DeptVO;
import com.biz.big.model.ProductVO;
import com.biz.big.service.DeptService;
import com.biz.big.service.IoService;
import com.biz.big.service.ProductService;

@Controller
@RequestMapping(value = "/io")
public class IoController {
	
	@Autowired
	@Qualifier("ioServV1")
	private IoService ioService;
	
	@Autowired
	@Qualifier("deptServV1")
	private DeptService deptService;
	
	@Autowired
	@Qualifier("productServV1")
	private ProductService proService;

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

		LocalDateTime dateTime = LocalDateTime.now();

		String date = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(dateTime);
		String time = DateTimeFormatter.ofPattern("HH:mm:ss").format(dateTime);
		
		List<DeptVO> deptList = deptService.selectAll();
		List<ProductVO> proList = proService.selectAll();
		
		model.addAttribute("DATE", date);
		model.addAttribute("TIME", time);
		model.addAttribute("DEPTLIST", deptList);
		model.addAttribute("PROLIST", proList);

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
