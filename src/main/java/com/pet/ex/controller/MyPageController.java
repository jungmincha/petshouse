package com.pet.ex.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/myPage")
public class MyPageController {

	// 장바구니 목록 페이지 이동
	@GetMapping("/cart")
	public ModelAndView cart(ModelAndView mav) {
		log.info("myPage/cart");
		mav.setViewName("/myPage/cart");
		return mav;
	}

	// 장바구니 목록 페이지 이동
	@GetMapping("/cartTest")
	public ModelAndView cartTets(ModelAndView mav) {
		log.info("myPage/cart");
		mav.setViewName("/myPage/cartTest");
		return mav;
	}

}
