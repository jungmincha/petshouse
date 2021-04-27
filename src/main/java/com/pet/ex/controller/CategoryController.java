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
	@RequestMapping("/home")
	public ModelAndView categoryhome(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {
 
		log.info("home...");
		/* mav.addObject("goods", service.getGoods()); */
		
		mav.addObject("goods", service.getboard());//전체상품 조회
		
		mav.addObject("rate", service.getStorerate());
		
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory());
		mav.setViewName("category/home");


		return mav;
	}
	
	
	
	
	// 카테고리 메인페이지_ajax_return
		@RequestMapping("/home_return")
		public ModelAndView categoryhome_return(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {
	 
			log.info("home_return...");
			/* mav.addObject("goods", service.getGoods()); */
			
			mav.addObject("goods", service.getboard());//전체상품 조회
			
			mav.addObject("rate", service.getStorerate());
			
			mav.addObject("category", service.getCategory());
			mav.addObject("smallcategory", service.getScategory());
			mav.setViewName("category/home_return");


			return mav;
		}
		
		
		// 카테고리 메인페이지_ajax_return
				@RequestMapping("/small/home_return")
				public ModelAndView category_smallhome_return(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {
			 
					log.info("home_return...");
					/* mav.addObject("goods", service.getGoods()); */
					
					mav.addObject("goods", service.getboard());//전체상품 조회
					
					mav.addObject("rate", service.getStorerate());
					
					mav.addObject("category", service.getCategory());
					mav.addObject("smallcategory", service.getScategory());
					mav.setViewName("category/home_return");


					return mav;
				}
		

	

	@RequestMapping("/smallcategory/{category_id}")
	public ModelAndView smallcategory(@RequestBody String name, GoodsVO goodsvo, BoardVO boardvo, ModelAndView mav, CategoryVO categoryvo)  {



			mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
			mav.addObject("rate", service.getStorerate());
			mav.addObject("category", service.getCategory());
			mav.addObject("rate", service.getStoreSmallrate(categoryvo.getCategory_id()));
			mav.addObject("smallcategory", service.getScategory());
			
			
			
	//소분류 값  추출하는 로직 -start
			
		  name=name.substring(9);
		  
		  int idx = name.indexOf("\""); 
		  
		  String name1 = name.substring(0, idx);
			
			mav.addObject("sgname", name1); 
			System.out.println("=====================================================================================");

		System.out.println(categoryvo.getCategory_id());
		
		
		  int smallCategory_id = categoryvo.getCategory_id();
		  // smallCategory_id을 보내주기 위해 string으로 변환해준다. 
		 
		  String sCategory_id = Integer.toString(smallCategory_id);
		  
		  
		  
		  mav.addObject("smallCategory_id", sCategory_id);

		
		mav.setViewName("category/smallcategory");
		log.info("smallcategory...");
		
		System.out.println(sCategory_id);
		System.out.println(name1);
		
		//소분류 값  추출하는 로직 -end

		return mav;

	}

	//전체 가격 높은순
	@PostMapping("/highprice")
	public ModelAndView pricecategory(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws Exception{
		
		mav.addObject("goods", service.gethighprice());

		mav.addObject("rate", service.getStoreHighrate());
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory());

		mav.setViewName("category/highprice");
		
		log.info("highprice...");

		return mav;
	}
	
	//전체 가격 낮은순
	@PostMapping("/rowprice")
	public ModelAndView rowcategory(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardvo) throws Exception{
		
		mav.addObject("goods", service.getrowprice());
		mav.addObject("rate", service.getStoreRowrate());
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory());

		mav.setViewName("category/rowprice");
		
		log.info("rowprice...");

		return mav;
	}
	
	//전체 별점 높은순
	@PostMapping("/highstar")
	public ModelAndView highstar(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {


		
		mav.addObject("goods", service.getboard());//별점순 조회
		mav.addObject("rate", service.gethighStar());//별점 리뷰 조회
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory());
		mav.setViewName("category/highprice");
		
		log.info("highstar...");

		return mav;
	}
	
	
	//전체 리뷰 많은순
		@PostMapping("/highreview")
		public ModelAndView highreview(GoodsVO goodsvo, ModelAndView mav, CategoryVO categoryvo , BoardVO boardVO) throws Exception {
		
			mav.addObject("goods", service.getboard());//별점순 조회
			mav.addObject("rate", service.gethighReview());//별점 리뷰 조회
			mav.addObject("category", service.getCategory());
			mav.addObject("smallcategory", service.getScategory());
			mav.setViewName("category/highreview");
			
			log.info("highreview...");

			return mav;
		}
	
	
	
	
	// 소분류 가격 낮은순
	@PostMapping("/small/srowprice")
	public ModelAndView srowcategory(@RequestBody String id ,CategoryVO categoryvo ,GoodsVO goodsvo, ModelAndView mav , BoardVO boardvo) throws Exception{
		
		/* mav.addObject("goods", service.getrowprice()); */
		System.out.println("==============dddddddddddddd===================================================");
		System.out.println(categoryvo.getCategory_id());

		  id = id.substring(7);
		  int idx = id.indexOf("\"");
		  String id1 = id.substring(0, idx);
		  
		  
		categoryvo.setCategory_id(Integer.parseInt(id1));
		mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
		mav.addObject("rate", service.getSmallPriceRowrate(categoryvo.getCategory_id()));
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory());
		  
		
		 
		 
	
		mav.addObject("smallCategory_id", id1);
		mav.setViewName("category/small/srowprice");
		
		
		
		log.info("srowprice...");

		System.out.println("========================================================================================================================");

	 System.out.println(id1); 
	 
	 System.out.println(categoryvo.getCategoryname());
	
		return mav;
	}
	
	
	
	// 소분류 가격 높은순
	@PostMapping("/small/shighprice")
	public ModelAndView shighcategory(@RequestBody String id , CategoryVO categoryvo ,GoodsVO goodsvo, ModelAndView mav , BoardVO boardvo) throws Exception{
		  id=id.substring(7);
		  int idx = id.indexOf("\"");
		  String id1 = id.substring(0, idx);
		  
		  categoryvo.setCategory_id(Integer.parseInt(id1));
	
		mav.addObject("rate", service.getSmallPriceHightrate(categoryvo.getCategory_id()));
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory());
		mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
		  
		
		 
		 
		//mav.addObject("smallgoods", service.gethighSmallGoods(categoryvo.getCategory_id()));
		mav.setViewName("category/small/shighprice");
		mav.addObject("smallCategory_id", id1);
		
		log.info("shighprice...");
		System.out.println("========================================================================================================================");
	
	 System.out.println(id1); 
	
		return mav;
	}
	
	
	// 소분류 별점 높은순
	@PostMapping("/small/shighstar")
	public ModelAndView shighstar(@RequestBody String id , CategoryVO categoryvo ,GoodsVO goodsvo, ModelAndView mav , BoardVO boardvo) throws Exception{
			id=id.substring(7);
			int idx = id.indexOf("\"");
			String id1 = id.substring(0, idx);
			categoryvo.setCategory_id(Integer.parseInt(id1));
		/* mav.addObject("goods", service.getrowprice()); */
		mav.addObject("rate", service.getSmallhighStar(categoryvo.getCategory_id()));//별점 리뷰 조회
		mav.addObject("category", service.getCategory());
		mav.addObject("smallcategory", service.getScategory());
		 
		 
		mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
		mav.addObject("smallCategory_id", id1);
		mav.setViewName("category/small/shighstar");
		
		
		
		log.info("shighstar...");
		System.out.println("========================================================================================================================");

	 System.out.println(id1); 
	
		return mav;
	}
	
	
	// 소분류 리뷰 많은순
		@PostMapping("/small/shighreview")
		public ModelAndView shighreview(@RequestBody String id , CategoryVO categoryvo ,GoodsVO goodsvo, ModelAndView mav , BoardVO boardvo) throws Exception{
				id=id.substring(7);
				int idx = id.indexOf("\"");
				String id1 = id.substring(0, idx);
				categoryvo.setCategory_id(Integer.parseInt(id1));
			/* mav.addObject("goods", service.getrowprice()); */
			mav.addObject("rate", service.getSmallhighReview(categoryvo.getCategory_id()));//별점 리뷰 조회
			mav.addObject("category", service.getCategory());
			mav.addObject("smallcategory", service.getScategory());
			 
			 
			mav.addObject("smallgoods", service.getSmallGoods(categoryvo.getCategory_id()));
			mav.addObject("smallCategory_id", id1);
			mav.setViewName("category/small/shighreview");
			
			
			
			log.info("shighstar...");
			System.out.println("========================================================================================================================");

		 System.out.println(id1); 
		
			return mav;
		}
		
	
	
	
	
	
	
		
	
	
}