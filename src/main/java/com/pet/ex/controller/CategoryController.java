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
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("/home")
 
	public ModelAndView categoryhome(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {
 

		/* mav.addObject("goods", service.getGoods()); */
		
		mav.addObject("goods", service.getboard());//전체상품 조회
		
		mav.addObject("rate", service.getStorerate());
		
		
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));
		
		mav.setViewName("category/home");

		return mav;
	}

	

	@PostMapping("/smallcategory/{category_id}")
	public ModelAndView smallcategory(@RequestBody GoodsVO goodsvo, BoardVO boardvo, ModelAndView mav, CategoryVO categoryvo) {

			

			mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
			
			mav.addObject("category", service.getCategory());
			
			mav.addObject("smallcategory", service.getScategory(categoryvo));
			/* mav.addObject("rate", service.getStorerate()); */
		
		mav.setViewName("category/smallcategory");
		
		return mav;

	}

	
	@GetMapping("/highprice")
	public ModelAndView pricecategory(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws Exception{
		
		mav.addObject("goods", service.gethighprice());

		mav.addObject("rate", service.getStorerate());
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));

		mav.setViewName("category/highprice");
		
		

		return mav;
	}
	
	
	@GetMapping("/rowprice")
	public ModelAndView rowcategory(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws Exception{
		
		mav.addObject("goods", service.getrowprice());
		mav.addObject("rate", service.getStorerate());
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));

		mav.setViewName("category/rowprice");
		
		

		return mav;
	}
	
	
	@GetMapping("/highstar")
	public ModelAndView highstar(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {


		
		mav.addObject("goods", service.getboard());//별점순 조회
		
		mav.addObject("rate", service.gethighStar());//별점 리뷰 조회
		
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));
		
		mav.setViewName("category/highprice");

		return mav;
	}
	
	
	
	
	/*
	 * @GetMapping("/shighprice") public ModelAndView spricecategory(GoodsVO
	 * goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws
	 * Exception{
	 * 
	 * mav.addObject("smallgoods",
	 * service.getshighprice(categoryvo.getCategory_id())); //mav.addObject("rate",
	 * service.getStorerate()); mav.addObject("category", service.getCategory());
	 * mav.addObject("smallcategory", service.getScategory(categoryvo));
	 * 
	 * mav.setViewName("category/small/shighprice");
	 * 
	 * 
	 * 
	 * return mav; }
	 */
	
	
	
	
	
	
		
	
	
}