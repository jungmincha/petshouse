package com.pet.ex.controller;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.MapService;


import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/map")
public class MapController {
	
	private MapService service;
	
	//펫츠타운 위치기반동의 페이지
	@GetMapping("/home")
	public String map() {
		
	
		
		return "map/home";
	}
	
	
	
	
	//펫츠타운 메인페이지
	@GetMapping("/petstown")
	   public ModelAndView petstown(ModelAndView mav , Criteria cri) {
	      
		
		
		mav.addObject("list", service.getList(cri));
		int total = service.getTotal(cri);
		
		mav.addObject("pageMaker",  new PageVO(cri, total));
	      mav.setViewName("map/petstown");
	      
	      return mav;
	   }
	
	

}
