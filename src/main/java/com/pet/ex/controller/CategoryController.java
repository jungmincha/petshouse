package com.pet.ex.controller;

import java.util.List;


import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.CategoryService;
import com.pet.ex.service.StoreService;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.StockVO;




import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@AllArgsConstructor
@Controller
@RequestMapping("/category")
public class CategoryController {
//test3
	
	
	

		//카테고리서비스 
	CategoryService service;
	
		//카테고리 메인페이지
	  @GetMapping("/categoryhome") 
	  public String categoryhome(GoodsVO goodsVO, Model model , CategoryVO categoryVO) throws Exception { 
	
		  model.addAttribute("goods", service.getGoods());
	

		
		  
		  model.addAttribute("category", service.getCategory());
		  model.addAttribute("smallcategory", service.getScategory(categoryVO));
	
		  
		  
		  
		  
		  
		  	  
	  return "category/categoryHome"; 
	  }
	  
	  
	  @GetMapping("/categoryhome/{category_id}") 
	  public ModelAndView bigcategory(GoodsVO goodsVO, ModelAndView mv , CategoryVO categoryVO) throws Exception { 
		  
		
		 
		 mv.addObject("bigcategory", service.getbigcategory(categoryVO.getCategory_id()));
	  
	mv.setViewName("category/bigcategory");
	  
	  return mv;
}
 
}