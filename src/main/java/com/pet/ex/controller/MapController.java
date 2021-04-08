package com.pet.ex.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.MapService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j

@RequestMapping("/map")
@Controller
public class MapController {
	
	private MapService service;
	
	//펫츠타운 위치기반동의 페이지
	@RequestMapping("/home")
	public String map() {
		
	
		
		return "map/home";
	}
	
	
	
	
	
	
	
	
	
	//펫츠타운 메인페이지
	@RequestMapping("/board")
	   public ModelAndView petstown(@RequestParam(value="test") String loc, 
			   
			   @RequestParam(value="member_id") String member_id,
			   
			   ModelAndView mav , Criteria cri , MemberVO memberVO) {
	      	
		mav.addObject("list", service.getList(cri));
		int total = service.getTotal(cri);
		
		mav.addObject("pageMaker",  new PageVO(cri, total));
		mav.addObject("location", loc);
		
		
		memberVO.setLocation(loc);
		
		service.insertLoc(memberVO);
	
		
		System.out.println(member_id);
		
	      mav.setViewName("map/petstown");
	      System.out.println("===============================================================================");
	      System.out.println(loc);
	      return mav;
	   }
	
	
	
	@RequestMapping("/write_view")
	  public ModelAndView write_view(ModelAndView mav) {
	  
	  log.info("write_view...");
	  
	  mav.setViewName("map/write_view");
	  
	 
	  return mav;
	 }
	
	//content_view 페이지
	@RequestMapping("/board/{board_id}")
	public String content_view(Model model, BoardVO boardVO) {
		
		log.info("rest_content_view...");
		
	
		model.addAttribute("content_view", service.content_view(boardVO.getBoard_id()));
		
		return "map/content_view";
		
	}
	
	
	
	
	
	//write
		  @RequestMapping("/write")//글작성 폼에서 정보입력(즉, insert) 
		  public String write(BoardVO boardVO)throws Exception 
		  
		  { 
			  log.info("write"); 
			  service.write(boardVO);
			  return "redirect:board";
			  
		  }
		  
		  
		  
		 
	 //delete
		  @RequestMapping("/delete/{board_id}")
		   public String delete(BoardVO boardVO, Model model) throws Exception{

		      
		      
		      log.info("delete");
		      service.inputDelete(boardVO.getBoard_id());
		      
		      
		      return "redirect:board";
		   }
		   
	
	
	
	

}
