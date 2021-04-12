package com.pet.ex.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
			 @RequestParam(value="location" ,required = false)String loc, //insert해서 바뀐 주소 홍제 2동을 받아옴 
			 
			   @RequestParam(value="member_id",required = false)String member_id,
			   
			   @RequestParam(value="nickname",required = false)String nickname,
			   
			   
				/* @RequestParam(value="s_location",required = false)String s_location, */
		
			   //@RequestParam(value="original_location",required = false)String original_location, //원래 주소
			   
			  
			   ModelAndView mav , Criteria cri , MemberVO memberVO, BoardVO boardVO) {
		
		 memberVO.setLocation(loc); //홍제 2동 받아옴
		 
		 //insert 현재위치
		 service.insertLoc(memberVO); //홍제 2동 삽입된
		
		
		 boardVO.setLocation(loc); //여기서도 홍제 2동 삽입됨 
		 
		mav.addObject("list", service.getList(cri));
		
		int total = service.getTotal(cri);
			 
		
		mav.addObject("pageMaker",  new PageVO(cri, total));
		
	 mav.addObject("location", loc); 
		 
	 mav.addObject("member_id", member_id); 
	 mav.addObject("nickname", nickname); 

		 
	
		
		System.out.println(member_id);
		System.out.println("insert 구문" + loc);
		   System.out.println("===============================================================================");
//	System.out.println("시큐리티 인증"+s_location);

		 mav.setViewName("map/board"); 
	   
	    
	      return mav;
	   }
	
	
	@GetMapping("/search")
	public ModelAndView search(
			
			 @RequestParam(value="location" ,required = false)String loc, //insert해서 바뀐 주소 홍제 2동을 받아옴 
			 
			   @RequestParam(value="member_id",required = false)String member_id,
			   
			   @RequestParam(value="nickname",required = false)String nickname,
			   
			   
				/* @RequestParam(value="s_location",required = false)String s_location, */
		
			   //@RequestParam(value="original_location",required = false)String original_location, //원래 주소
			   
			  
			   ModelAndView mav , Criteria cri , MemberVO memberVO, BoardVO boardVO) {
		
		 memberVO.setLocation(loc); //홍제 2동 받아옴
		 
		 //insert 현재위치
		 service.insertLoc(memberVO); //홍제 2동 삽입된
		
		
		 boardVO.setLocation(loc); //여기서도 홍제 2동 삽입됨 
		 
		mav.addObject("list", service.getSerchList(cri));
		
		int total = service.getTotal(cri);
			 
		
		mav.addObject("pageMaker",  new PageVO(cri, total));
		
	 mav.addObject("location", loc); 
		 
	 mav.addObject("member_id", member_id); 
	 mav.addObject("nickname", nickname); 

		 
	
		
		System.out.println(member_id);
		System.out.println("insert 구문" + loc);
		   System.out.println("===============================================================================");
//	System.out.println("시큐리티 인증"+s_location);

		 mav.setViewName("map/board"); 
		
		
		
		
		
		
		return mav;
	}
	
	
	
	@GetMapping("/write_view")
	  public ModelAndView write_view(
			  
			  @RequestParam(value="location" ,required = false)String loc,
				 
			   @RequestParam(value="member_id",required = false)String member_id,
			  
			   @RequestParam(value="nickname",required = false)String nickname,
			   
			  // @RequestParam(value="original_location",required = false)String original_location, //원래 주소
			  
			  ModelAndView mav) {
	  
	  log.info("write_view...");
	  
	  
	  mav.addObject("location", loc); 
		 
		 mav.addObject("member_id", member_id); 
		 
		 mav.addObject("nickname", nickname); 
		 System.out.println(member_id);
			System.out.println(loc);
			   System.out.println("=========================================================================================================");
	  mav.setViewName("map/write_view");
	  
	 
	  return mav;
	 }
	
	
	
	
	//content_view 페이지
	@GetMapping("/board/{board_id}")
	public ModelAndView content_view(
			
			 @RequestParam(value="location" ,required = false)String loc,
			 
			   @RequestParam(value="member_id",required = false)String member_id,			
			
			   @RequestParam(value="nickname",required = false)String nickname,
			   
			  // @RequestParam(value="original_location",required = false)String original_location, //원래 주소
			ModelAndView mav, BoardVO boardVO) {
		
		mav.addObject("location", loc); 
		 
		 mav.addObject("member_id", member_id); 
		 System.out.println(member_id);
			System.out.println(loc);
			   System.out.println("===============================================================================");
		
		
		log.info("rest_content_view...");
		
	
		mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));
		 mav.addObject("nickname", nickname); 
		mav.setViewName("map/content_view");
		return mav;
		
	}
	
	
	
	
	
	//write
		  @RequestMapping("/write")//글작성 폼에서 정보입력(즉, insert) 
		  public ModelAndView write(
				  
				  @RequestParam(value="location" ,required = false)String loc,
					 
				   @RequestParam(value="member_id",required = false)String member_id,
				  
				   @RequestParam(value="nickname",required = false)String nickname,
				   
				 //  @RequestParam(value="original_location",required = false)String original_location, //원래 주소
				  
				  ModelAndView mav ,BoardVO boardVO, MemberVO memberVO, Criteria cri )throws Exception 
		  
		  { 
			  log.info("write"); 
			  

			  MemberVO member = new MemberVO();
				boardVO.setMemberVO(member);
				boardVO.getMemberVO().setLocation(loc);
				boardVO.getMemberVO().setMember_id(member_id);
	
	
			  service.write(boardVO);
			  
		
			  
			  
			  mav.addObject("list", service.getList(cri));
				
				int total = service.getTotal(cri);
				
				mav.addObject("pageMaker",  new PageVO(cri, total));
			  
				
			  memberVO.setLocation(loc);
			  
				service.insertLoc(memberVO);
				
				
				
				 mav.addObject("location", loc); 
				 
			 mav.addObject("member_id", member_id); 
			 mav.addObject("nickname", nickname); 
				 System.out.println(member_id); 
				 System.out.println(loc);
				 
				 
			  mav.setViewName("redirect:board");
			  return mav;
			  
		  }
		  
		  
		  
		 
	 //delete
		  @RequestMapping("/delete/{board_id}")
		   public ModelAndView delete(ModelAndView mav ,BoardVO boardVO) throws Exception{
	      
		      log.info("delete");
		      service.inputDelete(boardVO.getBoard_id());
		      
		      mav.setViewName("redirect:board");
		      
		      return mav;
		   }
		   
	
	
	
	

}
