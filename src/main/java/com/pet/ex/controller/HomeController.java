package com.pet.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.HomeService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {

	@Autowired
	private HomeService service;

	// 홈으로 이동
	@RequestMapping("/home")
	public ModelAndView home(ModelAndView mav) {
		log.info("/");
		mav.setViewName("home/home");

		return mav;
	}

	// 글 검색
	@GetMapping("/search")
	public ModelAndView search(@RequestParam("keyword") String keyword, ModelAndView mav,Criteria cri)
			throws Exception {
		log.info("search()실행");
		mav.addObject("moregoods", service.getMoreGoods(keyword, cri));
		mav.addObject("moreqna", service.getMoreQna(keyword,cri));
		mav.addObject("moretips", service.getMoreTips(keyword,cri));
		mav.setViewName("/home/search");
		return mav;
	}

	// 검색 더보기
	@GetMapping("/moregoods")
	public ModelAndView moregoods(@RequestParam("keyword") String keyword, Criteria cri, ModelAndView mav,
			BoardVO boardVO) throws Exception {
		log.info("moregoods()실행");
		System.out.println(keyword);
		mav.addObject("moregoods", service.getMoreGoods(keyword, cri));
		mav.setViewName("/home/moregoods");
		return mav;
	}

	// 검색 ajax 더보기
	@PostMapping("/goodsmorelist")
	public Map<String, Object> goodslist(@RequestParam("keyword") String keyword, Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> goodslist = service.getMoreGoods(keyword, cri);
		list.put("goodslist", goodslist);
		return list;
	}

	@GetMapping("/moreqna")
	public ModelAndView moreqna(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO, Criteria cri)
			throws Exception {
		log.info("moreqna()실행");
		System.out.println(keyword);
		mav.addObject("moreqna", service.getMoreQna(keyword,cri));
		mav.setViewName("/home/moreqna");
		return mav;
	}


	@GetMapping("/moretips")
	public ModelAndView moretips(@RequestParam("keyword") String keyword, ModelAndView mav,Criteria cri)
			throws Exception {
		log.info("moretips()실행");
		System.out.println(keyword);
		mav.addObject("moretips", service.getMoreTips(keyword,cri));
		mav.setViewName("/home/moretips");
		return mav;
	}
	
	// 검색 ajax 더보기
	@PostMapping("/tipsmorelist")
	public Map<String, Object> tipslist(@RequestParam("keyword") String keyword, Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> tipslist = service.getMoreTips(keyword, cri);
		list.put("tipslist", tipslist);
		return list;
	}

}
