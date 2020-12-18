package com.biz.big.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.big.model.DeptVO;
import com.biz.big.model.ProductVO;
import com.biz.big.service.DeptService;
import com.biz.big.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Autowired
	@Qualifier("productServV1")
	private ProductService proService;

	@Autowired
	@Qualifier("deptServV1")
	private DeptService deptService;

	@RequestMapping(value = "/list")
	public String list(Model model) {

		List<ProductVO> proList = proService.selectAll();
		model.addAttribute("PROLIST", proList);
		model.addAttribute("BODY", "PRODUCT_LIST");
		return "home";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Model model) {

		List<DeptVO> deptList = deptService.selectAll();
		model.addAttribute("DEPTLIST", deptList);
		return "product/product_input";
	}

	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input(ProductVO vo) {

		proService.insert(vo);
		return "redirect:/product/list";
	}

	@RequestMapping(value = "/detail")
	public String detail(Model model, @ModelAttribute("id") String id) {

		ProductVO vo = proService.findById(id);
		model.addAttribute("PROVO", vo);
		return "product/product_detail";
	}

	@RequestMapping(value = "/delete")
	public String delete(@ModelAttribute("id") String id) {
		
		proService.delete(id);
		return "redirect:/product/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("id") String id, @ModelAttribute("PROVO") ProductVO vo) {

		vo = proService.findById(id);
		model.addAttribute("PROVO", vo);
		List<DeptVO> deptList = deptService.selectAll();
		model.addAttribute("DEPTLIST", deptList);
		return "product/product_input";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("PROVO") ProductVO vo) {
		proService.update(vo);
		return "redirect:/product/list";
	}

}
