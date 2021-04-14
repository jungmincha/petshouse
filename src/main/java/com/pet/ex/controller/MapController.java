package com.pet.ex.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.CommunityService;
import com.pet.ex.service.MapService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j

@RequestMapping("/map")
@RestController
public class MapController {
	
	private MapService service;

	
	//펫츠타운 위치기반동의 페이지
	@GetMapping("/home")
	public ModelAndView map(ModelAndView mav) {
		
	mav.setViewName("map/home");
		
		return mav;
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
	
	
	
	
	
	@GetMapping("/write_view")
	  public ModelAndView write_view(
			  
			  @RequestParam(value="location" ,required = false)String loc,
				 
			   @RequestParam(value="member_id",required = false)String member_id,
			  
			   @RequestParam(value="nickname",required = false)String nickname,
			   
			  // @RequestParam(value="original_location",required = false)String original_location, //원래 주소
			  
			  ModelAndView mav , BoardVO boardVO) {
	  
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
		 mav.addObject("comment", service.listComment(boardVO.getBoard_id()));
		 System.out.println(member_id);
			System.out.println(loc);
			   System.out.println("===============================================================================");
		
		
		log.info("rest_content_view...");
		
	
		mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));
		 mav.addObject("nickname", nickname); 
		mav.setViewName("map/content_view");
		return mav;
		
	}
	
	
	
	@GetMapping("/modify_view/{board_id}")
	  public ModelAndView modify_view(
			  
			  @RequestParam(value="location" ,required = false)String loc,
				 
			   @RequestParam(value="member_id",required = false)String member_id,
			  
			   @RequestParam(value="nickname",required = false)String nickname,
			   
			  // @RequestParam(value="original_location",required = false)String original_location, //원래 주소
			  
			  ModelAndView mav , BoardVO boardVO) {
	  
	  log.info("modify_view...");
	  
	 
	  mav.addObject("location", loc); 
	  mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));
		 mav.addObject("member_id", member_id); 
		 
		 mav.addObject("nickname", nickname); 
		 System.out.println(member_id);
			System.out.println(loc);
			   System.out.println("=========================================================================================================");
	  mav.setViewName("map/modify_view");
	  
	 
	  return mav;
	 }
	
	
	
	
	
	//write
		  @RequestMapping("/write")//글작성 폼에서 정보입력(즉, insert) 
		  public ModelAndView write(
				  
				  @RequestParam(value="location" ,required = false)String loc,
					 
				   @RequestParam(value="member_id",required = false)String member_id,
				  
				   @RequestParam(value="nickname",required = false)String nickname,
				   
				  
				   
				 //  @RequestParam(value="original_location",required = false)String original_location, //원래 주소
				  
				  ModelAndView mav ,ImageVO imageVO, BoardVO boardVO, MemberVO memberVO, Criteria cri , MultipartHttpServletRequest multi)throws Exception 
		  
		  { 
			  log.info("write"); 
			  

			  MemberVO member = new MemberVO();
				boardVO.setMemberVO(member);
				boardVO.getMemberVO().setLocation(loc);
				boardVO.getMemberVO().setMember_id(member_id);
				boardVO.getMemberVO().setNickname(nickname);
				
				
				
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
				 
			
				 
					/*
					 * String path =
					 * multi.getSession().getServletContext().getRealPath("/static/img/location");
					 * 
					 * path = path.replace("webapp", "resources");
					 * 
					 * File dir = new File(path); if (!dir.isDirectory()) { dir.mkdir(); }
					 * 
					 * List<MultipartFile> mf = multi.getFiles("file");
					 * 
					 * 
					 * for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
					 * 
					 * UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경
					 * 
					 * String originalfileName = mf.get(i).getOriginalFilename(); String ext =
					 * FilenameUtils.getExtension(originalfileName); //저장 될 파일명 String
					 * imgname=uuid+"."+ext;
					 * 
					 * 
					 * String savePath = path + "\\" + imgname; // 저장 될 파일 경로
					 * 
					 * 
					 * 
					 * System.out.println(
					 * "============================================================================="
					 * ); System.out.println(savePath);
					 * 
					 * mf.get(i).transferTo(new File(savePath)); // 파일 저장
					 * imageVO.setImgname(imgname);
					 * imageVO.getBoardVO().setBoard_id(boardVO.getBoard_id()); System.out.println(
					 * "============================================================================="
					 * ); System.out.println(boardVO.getBoard_id());
					 * 
					 * service.detailInput(imageVO);
					 * 
					 * 
					 * 
					 * }
					 */
					 
			  mav.setViewName("redirect:board");
			  return mav;
			  
		  }
		  
		  
		  
	
		  
		// 질문과 답변 댓글 작성
		  
			@PostMapping("/map_view/insert")
			public BoardVO insertComment(BoardVO boardVO,
					
					  @RequestParam(value="location" ,required = false)String loc,
					  
					  
					  
					  @RequestParam(value="nickname",required = false)String nickname,
					 
					
					@RequestParam("member_id") String member_id) {
				MemberVO member = new MemberVO();
				boardVO.setMemberVO(member);
				boardVO.getMemberVO().setMember_id(member_id);
				service.insertComment(boardVO);
				BoardVO comments = service.getComment(boardVO.getPgroup());
				System.out.println(comments);
				return comments;
			}
		  
		  
		  
		  
		 
	 //delete
		  @RequestMapping("/delete")
		   public ModelAndView delete(
				   
					
					 // @RequestParam(value="location" ,required = false)String loc,
					  
					//  @RequestParam(value="member_id",required = false)String member_id,
					  
					 // @RequestParam(value="nickname",required = false)String nickname,
					
				   
				   
				   
				  int board_id, String location, String member_id, String nickname, ModelAndView mav ,BoardVO boardVO, MemberVO memberVO) throws Exception{
	      
			  System.out.println(board_id);
			  System.out.println(location);
			  System.out.println(member_id);
			  System.out.println(nickname);
			  
		      log.info("delete");
		      service.inputDelete(board_id);
		      
		      memberVO.setLocation(location);
			  
				service.insertLoc(memberVO);
				
				 mav.addObject("location", location); 
				 
				 mav.addObject("member_id", member_id); 
				 mav.addObject("nickname", nickname); 
		      
		      mav.setViewName("redirect:board");
		      
		      return mav;
		   }
		  
		  
		  
		   
		  @GetMapping("/location/tag")
			public List<BoardVO> tag(String hashtag, String location, Criteria cri , BoardVO boardVO) throws Exception {
				
			 
		
			  List<BoardVO> list = new ArrayList<BoardVO>();
				
				
				
				
				if (hashtag == null) {
					
					
					list = service.getList(cri);
				} else {
					 MemberVO member = new MemberVO();
						boardVO.setMemberVO(member);
						boardVO.getMemberVO().setLocation(location);
						boardVO.setHashtag(hashtag);
					list = service.getHashtag(boardVO);
				}
				
				
				System.out.println("===확인===="+hashtag);
				System.out.println("===확인===="+location);
				log.info("hashtag...");
				return list;
			}
		  
		  
		
	

}
