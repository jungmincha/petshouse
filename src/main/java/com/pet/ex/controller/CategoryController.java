package com.pet.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.CategoryService;
import com.pet.ex.service.StoreService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.StockVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@AllArgsConstructor
@Controller
@RequestMapping("/category")
public class CategoryController {
//차정민

	// 카테고리서비스
	CategoryService service;

	// 카테고리 메인페이지
	@GetMapping("/categoryhome")
	public ModelAndView categoryhome(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws Exception {

		/* mav.addObject("goods", service.getGoods()); */
		
		mav.addObject("board", service.getboard());

		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));

		mav.setViewName("category/categoryHome");

		return mav;
	}

	/*
	 * @RequestMapping("/smallcategory.do") public ModelAndView
	 * smallcategory(GoodsVO goodsVO, ModelAndView mav , CategoryVO categoryVO)
	 * throws Exception {
	 * 
	 * 
	 * 
	 * mav.addObject("goods", service.getSmallGoods(categoryVO.getCategory_id()));
	 * 
	 * 
	 * 
	 * 
	 * mav.addObject("category", service.getCategory());
	 * mav.addObject("smallcategory", service.getScategory(categoryVO));
	 * 
	 * mav.addObject("goods", service.getSmallGoods());
	 * 
	 * 
	 * mav.setViewName("category/categoryHome");
	 * 
	 * return mav; }
	 */

	@PostMapping("/smallcategory.do/{category_id}")
	public ModelAndView smallcategory(@RequestBody GoodsVO goodsvo, BoardVO boardvo, ModelAndView mav, CategoryVO categoryvo) {

			

			mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
			
			mav.addObject("category", service.getCategory());
			
			mav.addObject("smallcategory", service.getScategory(categoryvo));

		
		mav.setViewName("category/smallcategory");
		return mav;

	}

	// 상품 카테고리 페이지 맵핑
	@GetMapping("/smallcategory")
	public String smallcategoryPage() {

		return "category/smallcategory";
	}

	// 동물 카테고리 ajax
	/*
	 * @PostMapping("/bigcategory/{category_id}") public ModelAndView cat(CategoryVO
	 * categoryVO, ModelAndView mav, GoodsVO goodsVO, Model model) throws Exception
	 * {
	 * 
	 * mav.addObject("goods", service.getGoods());
	 * 
	 * mav.addObject("category", service.getCategory());
	 * mav.addObject("smallcategory", service.getScategory(categoryVO));
	 * 
	 * mav.addObject("bigcategory",
	 * service.getbigcategory(categoryVO.getCategory_id()));
	 * 
	 * 
	 * mav.addObject("bigcategory",
	 * JSONArray.fromObject(service.getbigcategory(categoryVO.getCategory_id())));
	 * 
	 * 
	 * mav.setViewName("category/bigcategory");
	 * 
	 * return mav; }
	 */

}