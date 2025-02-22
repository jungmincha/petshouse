package com.pet.ex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public ModelAndView search(@RequestParam("keyword") String keyword, ImageVO imageVO, BoardVO boardVO, ModelAndView mav,Criteria cri)
			throws Exception {
		log.info("search()실행");
		
		int qcount = service.qcount(keyword);
		mav.addObject("qcount", qcount);
		
		int tcount = service.tcount(keyword);
		mav.addObject("tcount", tcount);
		
		int gcount = service.gcount(keyword);
		mav.addObject("gcount", gcount);
		
		int scount = service.scount(keyword);
		mav.addObject("scount", scount);
		mav.addObject("ccount", service.countComment(boardVO));
		mav.addObject("imgCount", service.imgCount(imageVO));
		mav.addObject("moregoods", service.getMoreGoods(keyword, cri));
		mav.addObject("moreqna", service.getMoreQna(keyword,cri));
		mav.addObject("moretips", service.getMoreTips(keyword,cri));
		mav.addObject("moresns", service.getMoreSns(keyword,cri));
		mav.addObject("rate", service.getStorerate(cri));	
		mav.setViewName("/home/search");
		
		return mav;
	}

	// 검색 더보기
	@GetMapping("/moregoods")
	public ModelAndView moregoods(@RequestParam("keyword") String keyword,  ImageVO imageVO,Criteria cri, ModelAndView mav,
			BoardVO boardVO) throws Exception {
		log.info("moregoods()실행");
		
		System.out.println(keyword);
		
		int gcount = service.gcount(keyword);
		mav.addObject("gcount", gcount); //검색 결과 수 뽑을떄
		mav.addObject("imgCount", service.imgCount(imageVO));
		mav.addObject("gocount", service.getGoodsCount(keyword)); 
		mav.addObject("moregoods", service.getMoreGoods(keyword, cri));
		mav.addObject("rate", service.getStorerate(cri));	
		mav.setViewName("/home/moregoods");
		
		return mav;
	}

	// 검색 ajax 더보기
	@PostMapping("/goodsmorelist")
	public Map<String, Object> goodslist(@RequestParam("keyword") String keyword, Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> rate = service.getStorerate(cri);
		List<BoardVO> moregoods = service.getMoreGoods(keyword, cri);
		list.put("rate", rate);
		list.put("moregoods", moregoods);
		return list;
	}
	
	@GetMapping("/moresns")
	public ModelAndView moresns(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO, Criteria cri)
			throws Exception {
		log.info("moresns()실행");
		int scount = service.scount(keyword);
		mav.addObject("scount", scount);
		System.out.println(keyword);
		mav.addObject("snscount", service.getSnsCount(keyword)); 
		mav.addObject("ccount", service.countComment(boardVO)); //댓글 수
		mav.addObject("moresns", service.getMoreSns(keyword,cri));
		mav.setViewName("/home/moresns");
		return mav;
	}
	
	// 검색 ajax 더보기
	@PostMapping("/snsmorelist")
	public Map<String, Object> snslist(@RequestParam("keyword") String keyword, BoardVO boardVO,Criteria cri) {
		log.info("snslist");
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> moresns = service.getMoreSns(keyword, cri);
		List<BoardVO> ccount = service.countComment(boardVO);
		list.put("snscount", service.getSnsCount(keyword));
		list.put("moresns", moresns);
		list.put("ccount", ccount);
		return list;
	}

	@GetMapping("/moreqna")
	public ModelAndView moreqna(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO, Criteria cri)
			throws Exception {
		log.info("moreqna()실행");
		int qcount = service.qcount(keyword);
		mav.addObject("qcount", qcount);
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
		int tcount = service.tcount(keyword);
		mav.addObject("tcount", tcount);
		mav.addObject("tipscount", service.getTipsCount(keyword)); 
		mav.addObject("moretips", service.getMoreTips(keyword,cri));
		mav.setViewName("/home/moretips");
		return mav;
	}
	
	// 검색 ajax 더보기
	@PostMapping("/tipsmorelist")
	public Map<String, Object> tipslist(@RequestParam("keyword") String keyword, Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> moretips = service.getMoreTips(keyword, cri);
		list.put("moretips", moretips);
		list.put("tipscount", service.getTipsCount(keyword));
		return list;
	}

}
