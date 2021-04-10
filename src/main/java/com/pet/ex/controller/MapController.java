package com.pet.ex.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
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
	@GetMapping("/home")
	public String map() {
		
	
		
		return "map/home";
	}
	
	
	
	
	
	
	
	
	
	
	//펫츠타운 메인페이지
	@GetMapping("/board")
	   public ModelAndView board(
			 @RequestParam(value="test" ,required = false)String loc,
			 
			   @RequestParam(value="member_id",required = false)String member_id,
			   
		
			  
			   ModelAndView mav , Criteria cri , MemberVO memberVO) {
	      	
		mav.addObject("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		
		 memberVO.setLocation(loc);
		 
		 
		 service.insertLoc(memberVO);
		 
		
		mav.addObject("pageMaker",  new PageVO(cri, total));
		
	 mav.addObject("location", loc); 
		 
	 mav.addObject("member_id", member_id); 
		 
		/* memberVO.setMember_id(member_id); */
		
			/*
			 * mav.addObject("member_list", service.getMemberList(memberVO.getMember_id()));
			 */
		
		  
		 
	
		
		System.out.println(member_id);
		System.out.println(loc);

		/* System.out.println(loc); */
		 mav.setViewName("map/board"); 
	      System.out.println("===============================================================================");
	    
	      return mav;
	   }
	
	
	
	@GetMapping("/write_view")
	  public ModelAndView write_view(
			  
			  @RequestParam(value="test" ,required = false)String loc,
				 
			   @RequestParam(value="member_id",required = false)String member_id,
			  
			  
			  ModelAndView mav) {
	  
	  log.info("write_view...");
	  
	  
	  mav.addObject("location", loc); 
		 
		 mav.addObject("member_id", member_id); 
		 System.out.println(member_id);
			System.out.println(loc);
			   System.out.println("===============================================================================");
	  mav.setViewName("map/write_view");
	  
	 
	  return mav;
	 }
	
	
	
	
	//content_view 페이지
	@GetMapping("/board/{board_id}")
	public ModelAndView content_view(
			
			 @RequestParam(value="test" ,required = false)String loc,
			 
			   @RequestParam(value="member_id",required = false)String member_id,			
			
			ModelAndView mav, BoardVO boardVO) {
		
		mav.addObject("location", loc); 
		 
		 mav.addObject("member_id", member_id); 
		 System.out.println(member_id);
			System.out.println(loc);
			   System.out.println("===============================================================================");
		
		
		log.info("rest_content_view...");
		
	
		mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));
		mav.setViewName("map/content_view");
		return mav;
		
	}
	
	
	
	
	
	//write
		  @GetMapping("/write")//글작성 폼에서 정보입력(즉, insert) 
		  public ModelAndView write(
				  
				  @RequestParam(value="test" ,required = false)String loc,
					 
				   @RequestParam(value="member_id",required = false)String member_id,
				  
				  
				  ModelAndView mav ,BoardVO boardVO, MemberVO memberVO, Criteria cri )throws Exception 
		  
		  { 
			  log.info("write"); 
			  

			  
	
	
			  service.write(boardVO);
			  
		
			  
			  
			  mav.addObject("list", service.getList(cri));
				
				int total = service.getTotal(cri);
				
				mav.addObject("pageMaker",  new PageVO(cri, total));
			  
				
			  memberVO.setLocation(loc);
			  
				service.insertLoc(memberVO);
				
				
				
				 mav.addObject("location", loc); 
				 
				 mav.addObject("member_id", member_id); 

				 System.out.println(member_id); 
				 
				 
			  mav.setViewName("map/board");
			  return mav;
			  
		  }
		  
		  
		  
		 
	 //delete
		  @RequestMapping("/delete/{board_id}")
		   public ModelAndView delete(ModelAndView mav ,BoardVO boardVO) throws Exception{
	      
		      log.info("delete");
		      service.inputDelete(boardVO.getBoard_id());
		      
		      mav.setViewName("map/board");
		      
		      return mav;
		   }
		   
	
	
	
	

}
