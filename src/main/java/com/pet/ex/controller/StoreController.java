package com.pet.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.service.CategoryService;
import com.pet.ex.service.StoreService;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PointVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/store")
public class StoreController {
	@Autowired
	StoreService service;
	
	@Autowired
	CategoryService categoryService;

	//storehome 이동
	@GetMapping("/home")
	public ModelAndView storehome(Criteria cri, ModelAndView mav) {
		log.info("storehome");
		mav.addObject("rate", service.getStorerate(cri));		
		mav.addObject("goods", service.getGoodsinfo());
		mav.setViewName("store/home");
		return mav;
	}
	
	//상품 더보기 
	@PostMapping("/morelist")
	public Map<String, Object> storehome(Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> rate = service.getStorerate(cri);
		List<BoardVO> goods = service.getGoodsinfo();
		list.put("rate", rate);
		list.put("goods", goods);
		return list;
	}

	//besthome 이동
	@GetMapping("/best")
	public ModelAndView best(Criteria cri, ModelAndView mav) {
		log.info("beststore");			
		mav.addObject("rate", service.getStorerate(cri));
		mav.addObject("goods", service.getGoodsinfo());	
		mav.setViewName("store/beststore");
		return mav;
	}
	
	//베스트 카테고리별 정렬
	@PostMapping("/best/{categoryVO.category_id}")
	public ModelAndView best(@PathVariable("categoryVO.category_id") int category_id, BoardVO boardVO, ModelAndView mav) {
		log.info("beststore");
		mav.addObject("rate", service.getBestrate(boardVO.getCategoryVO().getCategory_id()));
		mav.addObject("goods", service.getGoodsinfo());		
		mav.setViewName("store/bestcate");	
		return mav;	
	}
	
	//이벤트 페이지 이동
	@GetMapping("/event")
	public ModelAndView event(ModelAndView mav) {
		log.info("event");	
		mav.setViewName("store/event");
		return mav;
	}
	
	//이벤트 포인트 부여
	@PutMapping("/event")
	public ResponseEntity<String> event(@RequestParam("member_id") String member_id, PointVO pointVO) {
		log.info("point");
		MemberVO member = new MemberVO();
		pointVO.setMemberVO(member);
		pointVO.getMemberVO().setMember_id(member_id);
		ResponseEntity<String> entity = null;			
		try {
			int count = service.getEventstatus(pointVO);			
			log.info("count: " + count);	
			//이벤트 중복 참여 검사
			if(count >= 1) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}else{
				service.point(pointVO);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//커뮤홈 이동
	@GetMapping("/commu/home")
	public ModelAndView commuhome(ModelAndView mav) {
		log.info("commuhome");
		mav.addObject("knowhow", service.getKnowhow());
		mav.addObject("sns", service.getSns());			
		mav.setViewName("store/commuhome");
		return mav;
	}	
	
	//커뮤에서 카테고리 이동
	@GetMapping("/commu/category/{category_id}")
	public ModelAndView commuhome(ModelAndView mav, CategoryVO category, String categoryName) {
	   log.info(categoryName);
	   mav.addObject("category_id", category.getCategory_id());
	   mav.addObject("categoryName", categoryName);
	   mav.addObject("category", categoryService.getCategory());
	   mav.addObject("smallcategory", categoryService.getScategory());
	   mav.setViewName("category/home");	
	   return mav;
	}
	
	//팔로우 버튼
	@RequestMapping("/myPage/follow")
	public ModelAndView follow(ModelAndView mav) {
		log.info("follow");	
		mav.addObject("member_info", service.getMemberinfo());
		mav.setViewName("store/follow");
		return mav;
	}	

	//팔로우 상세 보기
	@PostMapping("/myPage/followview/{memberVO.member_id}")
	public ModelAndView followview(FollowVO followVO, Authentication authentication, ModelAndView mav) {
		log.info("follow");
		//팔로우 하려는 계정
		String member_id = followVO.getMemberVO().getMember_id();
		//회원 본인 계정
		String follower_id = authentication.getPrincipal().toString();	
		followVO.setFollower_id(follower_id);
		System.out.println(follower_id);

		//팔로우&팔로잉 수 
		mav.addObject("follower", service.getFollowertotal(member_id));
		mav.addObject("following", service.getFolloingtotal(member_id));
		//팔로우 유무 체크
		mav.addObject("followcheck", service.isFollow(followVO));
	
		mav.addObject("member_info", service.getMemberinfo());
		mav.setViewName("store/followview");
		return mav;
	}	
	
	//팔로우
	@PostMapping("/myPage/follow/{memberVO.member_id}")
	public ResponseEntity<String> follow(FollowVO followVO, Authentication authentication) {
		log.info("follow");
		String follower_id = authentication.getPrincipal().toString();	
		followVO.setFollower_id(follower_id);
		System.out.println(follower_id);

		ResponseEntity<String> entity = null;			
		try {	
			service.follow(followVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//언팔로우
	@PostMapping("/myPage/unfollow/{memberVO.member_id}")
	public ResponseEntity<String> unfollow(FollowVO followVO, Authentication authentication) {
		log.info("unfollow");
		String follower_id = authentication.getPrincipal().toString();	
		followVO.setFollower_id(follower_id);
		System.out.println(follower_id);
		
		ResponseEntity<String> entity = null;			
		try {	
			service.unfollow(followVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
