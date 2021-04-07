package com.pet.ex.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.FileService;
import com.pet.ex.service.StoreService;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/store")
public class StoreController {
	@Autowired
	StoreService service;
	
	//storehome 이동
	@GetMapping("/home")
	public ModelAndView storehome(Criteria cri, ModelAndView mav) {
		log.info("storehome");
		mav.addObject("rate", service.getStorerate());
		mav.addObject("bestrate", service.getStorerate(cri));
		int total = service.getStoretotal();
		mav.addObject("pageMaker", new PageVO(cri, total));		
		mav.addObject("goods", service.getGoodsinfo());
		mav.setViewName("store/home");
		return mav;
	}

	//besthome 이동
	@GetMapping("/best")
	public ModelAndView best(ModelAndView mav) {
		log.info("best");			
		mav.addObject("rate", service.getStorerate());
		mav.addObject("goods", service.getGoodsinfo());		
		mav.setViewName("store/beststore");
		return mav;
	}
	
	//베스트 카테고리별 정렬
	@PostMapping("/best/{categoryVO.category_id}")
	public ModelAndView best(@PathVariable("categoryVO.category_id") int category_id, BoardVO boardVO, ModelAndView mav) {
		log.info("beststore");
		mav.addObject("rate", service.getBestrate(boardVO.getCategoryVO().getCategory_id()));
		mav.addObject("goods", service.getGoodsinfo());		
		mav.setViewName("store/bestcate");	
		return mav;	
	}
	
	//이벤트 페이지 이동
	@GetMapping("/event")
	public ModelAndView event(ModelAndView mav) {
		log.info("event");	
		mav.setViewName("store/event4");
		return mav;
	}	
	
	//카테고리홈 이동
	@GetMapping("/commu/home")
	public ModelAndView commuhome(ModelAndView mav) {
		log.info("commuhome");
		mav.addObject("knowhow", service.getKnowhow());
		mav.addObject("sns", service.getSns());			
		mav.setViewName("store/commuhome");
		return mav;
	}	
	
	//카테고리별 이동
	@GetMapping("/commu/category/{category_id}")
	public ModelAndView commuhome(ModelAndView mav, CategoryVO category, String categoryName) {
	   log.info(categoryName);
	   mav.addObject("category_id", category.getCategory_id());
	   mav.addObject("categoryName", categoryName);
	   mav.setViewName("category/home");	
	   return mav;
	}
}
