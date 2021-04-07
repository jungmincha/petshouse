package com.pet.ex.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller; 

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.CategoryService;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;


import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@AllArgsConstructor
@Controller
@Slf4j
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
		log.info("home...");

		return mav;
	}

	

	@PostMapping("/smallcategory/{category_id}")
	public ModelAndView smallcategory(@RequestBody String name, GoodsVO goodsvo, BoardVO boardvo, ModelAndView mav, CategoryVO categoryvo)  {



			mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
			
			mav.addObject("category", service.getCategory());
			mav.addObject("rate", service.getStorerate());
			mav.addObject("smallcategory", service.getScategory(categoryvo));
			
	//소분류 값  추출하는 로직 -start
			
		  name=name.substring(9);
		  
		  int idx = name.indexOf("\""); 
		  
		  String name1 = name.substring(0, idx);
			
			mav.addObject("sgname", name1); 
			System.out.println("=====================================================================================");
		System.out.println(categoryvo.getCategoryname());
		
		mav.setViewName("category/smallcategory");
		log.info("smallcategory...");
		
		
		System.out.println(name1);
		
		//소분류 값  추출하는 로직 -end

		return mav;

	}

	
	@GetMapping("/highprice")
	public ModelAndView pricecategory(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws Exception{
		
		mav.addObject("goods", service.gethighprice());

		mav.addObject("rate", service.getStorerate());
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));

		mav.setViewName("category/highprice");
		
		log.info("highprice...");

		return mav;
	}
	
	
	@GetMapping("/rowprice")
	public ModelAndView rowcategory(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws Exception{
		
		mav.addObject("goods", service.getrowprice());
		mav.addObject("rate", service.getStorerate());
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));

		mav.setViewName("category/rowprice");
		
		log.info("rowprice...");

		return mav;
	}
	
	
	@GetMapping("/highstar")
	public ModelAndView highstar(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {


		
		mav.addObject("goods", service.getboard());//별점순 조회
		mav.addObject("rate", service.gethighStar());//별점 리뷰 조회
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));
		mav.setViewName("category/highprice");
		
		log.info("highstar...");

		return mav;
	}
	
	
	
	@PostMapping("/small/srowprice")
	public ModelAndView srowcategory(@RequestBody String id , CategoryVO categoryvo ,GoodsVO goodsvo, ModelAndView mav , BoardVO boardvo) throws Exception{
		
		/* mav.addObject("goods", service.getrowprice()); */
		mav.addObject("rate", service.getStorerate());
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory(categoryvo));
	
		
		
		
		mav.addObject("smallgoods", service.getrowSmallGoods(categoryvo.getCategory_id()));
		
		mav.setViewName("category/small/srowprice");
		
		
		
		log.info("srowprice...");
		System.out.println("========================================================================================================================");
		System.out.println(categoryvo.getCategory_id());
		System.out.println(id);
	
		return mav;
	}
	
	
	
	
	
	
	
		
	
	
}