package com.pet.ex.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.MapService;
import com.pet.ex.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
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
	@GetMapping("/board")
	   public ModelAndView petstown(ModelAndView mav , Criteria cri) {
	      	
		mav.addObject("list", service.getList(cri));
		int total = service.getTotal(cri);
		
		mav.addObject("pageMaker",  new PageVO(cri, total));
	      mav.setViewName("map/petstown");
	      
	      return mav;
	   }
	
	
	
	@GetMapping("/write_view")
	  public ModelAndView write_view(ModelAndView mav) {
	  
	  log.info("write_view...");
	  
	  mav.setViewName("map/write_view");
	  
	 
	  return mav;
	 }
	
	//content_view 페이지
	@GetMapping("/board/{board_id}")
	public String content_view(Model model, BoardVO boardVO) {
		
		log.info("rest_content_view...");
		
	
		model.addAttribute("content_view", service.content_view(boardVO.getBoard_id()));
		
		return "map/content_view";
		
	}
	
	
	
	
	
	//write
		  @PostMapping("/write")//글작성 폼에서 정보입력(즉, insert) 
		  public String write(BoardVO boardVO)throws Exception 
		  
		  { 
			  log.info("write"); 
			  service.write(boardVO);
			  return "redirect:board";
			  
		  }
		  
		  
		  
		 
	 //delete
		  @GetMapping("/delete/{board_id}")
		   public String delete(BoardVO boardVO, Model model) throws Exception{

		      
		      
		      log.info("delete");
		      service.inputDelete(boardVO.getBoard_id());
		      
		      
		      return "redirect:board";
		   }
		   
	
	
	
	

}
