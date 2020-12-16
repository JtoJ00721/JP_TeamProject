package com.biz.big.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.big.model.ProductVO;
import com.biz.big.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	@Qualifier("productServV1")
	private ProductService proService;

	@RequestMapping(value = "/list")
	public String list(Model model) {

		List<ProductVO> proList = proService.selectAll();
		model.addAttribute("PROLIST", proList);
		model.addAttribute("BODY", "PRODUCT_LIST");
		return "home";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Model model) {
		return "product/product_input";
	}

	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input(ProductVO vo) {
		
		proService.insert(vo);
		return "redirect:/product/list";
	}

	@RequestMapping(value = "detail")
	public String detail(Model model) {
		return "product/product_detail";
	}

	@RequestMapping(value = "/delete")
	public String delete() {
		return "redirect:/product/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model) {
		return "product/product_input";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update() {
		return "redirect:/product/list";
	}

}
