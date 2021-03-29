package com.pet.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.FileService;
import com.pet.ex.service.StoreService;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/store")
public class StoreController {
	@Autowired
	StoreService service;
	
	@Autowired
	FileService fileservice;

	@GetMapping("/product")
	public ModelAndView product(GoodsVO goodsVO, StockVO stockVO, ModelAndView mav) throws Exception {
		mav.addObject("stock", service.getStock2(stockVO.getStock_id()));
		mav.addObject("goods", service.getGoods2(goodsVO.getGoods_id()));
		mav.setViewName("store/product");
		return mav;
	}

	@GetMapping("/storehome")
	public ModelAndView storehome(ModelAndView mav) {
		mav.addObject("store", service.getStoreinfo());
		mav.addObject("rate", service.getRatescore());
		mav.setViewName("store/storehome");
		log.info("rate");
		return mav;
	}
	
	@GetMapping("/beststore")
	public ModelAndView beststore(ModelAndView mav) {
		mav.addObject("best", service.getBestinfo());
		mav.addObject("rate1", service.getRatescore());
		mav.setViewName("store/beststore2");
		return mav;
	}
	
	@GetMapping("/beststore/{categoryVO.category_id}")
//	@ResponseBody
//	public List<GoodsVO> beststore(GoodsVO goodsVO) {
	public ModelAndView catebest(GoodsVO goodsVO, ModelAndView mav) {
		log.info("catebest");
		//List<GoodsVO> bestlist = service.getBestlist(goodsVO.getCategoryVO().getCategory_id());
		mav.addObject("catebest", service.getBestlist(goodsVO.getCategoryVO().getCategory_id()));
		mav.addObject("rate2", service.getRatescore());
		mav.addObject("image", fileservice.getImgtest());
		mav.setViewName("store/beststore2");
		return mav;
	}
}
