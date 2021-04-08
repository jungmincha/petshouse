package com.pet.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.AdminService;

import com.pet.ex.vo.CategoryVO;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;


@Slf4j
@RestController
@RequestMapping("/commu")
public class SnsController {

	@Autowired
	/* private SnsService service; */
	private AdminService adminService;

	@GetMapping("/sns")
	public ModelAndView index(ModelAndView mav) throws Exception {

		log.info("index");
		mav.setViewName("sns/sns_list");

		return mav;
	}
	
	@GetMapping("/sns/write")
	public ModelAndView write(ModelAndView mav) throws Exception {

		log.info("write");
		List<CategoryVO> category = null;
		category = adminService.getCategory();

		mav.addObject("category", JSONArray.fromObject(category));
		mav.setViewName("sns/sns_write");

		return mav;
	}
	
	
}
