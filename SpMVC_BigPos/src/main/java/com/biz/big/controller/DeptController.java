package com.biz.big.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.big.mapper.DeptDao;
import com.biz.big.model.DeptVO;
import com.biz.big.service.DeptService;

@Controller
@RequestMapping(value = "/dept")
public class DeptController {

	@Autowired
	@Qualifier("deptServV1")
	private DeptService deptService;

	@RequestMapping(value = "/list")
	public String list(Model model) {

		List<DeptVO> deptList = deptService.selectAll();
		model.addAttribute("DEPTLIST", deptList);
		model.addAttribute("BODY", "DEPT_LIST");
		return "home";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Model model) {

		LocalDateTime dateTime = LocalDateTime.now();
		String insertDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(dateTime);
		String insertTime = DateTimeFormatter.ofPattern("HH:mm:SS").format(dateTime);

		model.addAttribute("DATE", insertDate);
		model.addAttribute("TIME", insertTime);
		
		return "dept/dept_input";
	}

	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input(@ModelAttribute("DEPTVO") DeptVO vo) {
		
		String seq = deptService.getNextNum();
		vo.setD_code(seq);
		
		deptService.insert(vo);
		return "redirect:/dept/list";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model) {
		return "dept/dept_detail";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		return "redirect:/dept/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("d_code") String d_code, @ModelAttribute("DEPTVO") DeptVO vo) {
		
		vo = deptService.findById(d_code);
		model.addAttribute("DEPTVO", vo);
		return "dept/dept_input";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("DEPTVO") DeptVO vo) {
		deptService.update(vo);
		return "redirect:/dept/list";
	}

}
