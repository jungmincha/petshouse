package com.pet.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.HomeService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {
	
	@Autowired
	private HomeService service;

	// 홈으로 이동
	@RequestMapping("/home")
	public ModelAndView home(ModelAndView mav) {
		log.info("/");
		mav.setViewName("home/home");

		return mav;
	}

	
	// 글 검색
		@PostMapping("/search")
		public ModelAndView search(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO, GoodsVO goodsVO)
				throws Exception {
			log.info("search()실행");
			mav.addObject("gsearch", service.getGsearch(keyword));
			mav.addObject("tsearch",service.getTsearch(keyword));
			mav.addObject("qsearch", service.getQsearch(keyword));
			mav.setViewName("/home/search");
			return mav;
		}
		
		
}
