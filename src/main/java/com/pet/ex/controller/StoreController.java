package com.pet.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.FileService;
import com.pet.ex.service.StoreService;

import com.pet.ex.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/store")
public class StoreController {
	@Autowired
	StoreService service;
	
	@Autowired
	FileService fileservice;

//	@GetMapping("/best/{categoryVO.category_id}")
////	@ResponseBody
////	public List<GoodsVO> beststore(GoodsVO goodsVO) {
//	public ModelAndView catebest(GoodsVO goodsVO, ModelAndView mav) {
//		log.info("catebest");
//		//List<GoodsVO> bestlist = service.getBestlist(goodsVO.getCategoryVO().getCategory_id());
//		mav.addObject("best", service.getBestlist(goodsVO.getCategoryVO().getCategory_id()));
//		mav.addObject("rate", service.getRatescore());
//		mav.addObject("image", fileservice.getImgtest());
//		mav.setViewName("store/best");
//		return mav;
//	}
	
	@GetMapping("/home")
	public ModelAndView storehome(ModelAndView mav) {
		log.info("storehome");
		mav.addObject("rate", service.getStorerate());	
		mav.addObject("goods", service.getGoodsinfo());
		mav.addObject("image", fileservice.getImgtest());

		mav.setViewName("store/home");
		return mav;
	}
	
	@GetMapping("/best/{categoryVO.category_id}")
	public ModelAndView best(BoardVO boardVO, ModelAndView mav) {
		log.info("beststore");
		mav.addObject("rate", service.getBestrate(boardVO.getCategoryVO().getCategory_id()));
		mav.addObject("goods", service.getGoodsinfo());
		mav.addObject("image", fileservice.getImgtest());
		
		mav.setViewName("store/beststore");
		return mav;
	}
	
	@GetMapping("/event")
	public ModelAndView event(ModelAndView mav) {
		log.info("event");
	
		mav.setViewName("store/event");
		return mav;
	}
	
	
}
