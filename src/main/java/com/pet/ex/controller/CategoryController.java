package com.pet.ex.controller;

import java.util.List;


import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
//차정민
	
	
	

		//카테고리서비스 
	CategoryService service;
	
		//카테고리 메인페이지
	  @GetMapping("/categoryhome") 
	  public ModelAndView categoryhome(GoodsVO goodsVO, ModelAndView mav , CategoryVO categoryVO) throws Exception { 
	
		  mav.addObject("goods", service.getGoods());
	

		
		  
		  mav.addObject("category", service.getCategory());
		  mav.addObject("smallcategory", service.getScategory(categoryVO));
	
		  mav.setViewName("category/categoryHome");
		  
		  
		  
		  
		  
		  	  
	  return mav; 
	  }
	  
	  
	  @GetMapping("/bigcategory/{category_id}") 
	  public ModelAndView cat(ModelAndView mav , GoodsVO goodsVO, Model model , CategoryVO categoryVO) throws Exception { 
		  
		
		  mav.addObject("goods", service.getGoods());		  
		  mav.addObject("category", service.getCategory());
		  mav.addObject("smallcategory", service.getScategory(categoryVO));
		  
		  
		  
		  mav.addObject("bigcategory", service.getbigcategory(categoryVO.getCategory_id()));
	  
	  mav.setViewName("category/bigcategory");
	  
	  return mav;
}
	  
	    
	  
	  
	  

}