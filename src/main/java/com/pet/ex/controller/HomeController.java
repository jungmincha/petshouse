package com.pet.ex.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {

	// 홈페이지 이동
	@RequestMapping("/home")
	public ModelAndView home(ModelAndView mav) {
		log.info("/");
		mav.setViewName("home/home");

		return mav;
	}

}
