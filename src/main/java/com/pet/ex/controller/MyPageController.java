package com.pet.ex.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.pet.ex.service.MyPageService;
import com.pet.ex.service.SecurityService;
import com.pet.ex.vo.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private SecurityService securityService;

	// 장바구니 목록 페이지 이동
	@GetMapping("/cart")
	public ModelAndView cart(ModelAndView mav, HttpServletRequest request, HttpSession session) {
		log.info("/myPage/cart");
		mav.setViewName("/myPage/cart");
		return mav;

	}

	// 장바구니 목록 불러오기 (ajax)
	@PostMapping(value = "/cartList", produces = "application/json; charset=utf8")
	public List<BoardVO> cartList2(@RequestBody List<Map<String, Object>> param) {
		log.info("/myPage/cartList");
		List<BoardVO> board = new ArrayList<BoardVO>();

		for (Map<String, Object> cart : param) {
			board.add(myPageService.getBoard((String) cart.get("board_id")));
		}
		return board;

	}

	@GetMapping("/cartTest")
	public ModelAndView cartTest(ModelAndView mav) {

		mav.setViewName("/myPage/cartTest");
		return mav;

	}

	// 결제 페이지 이동
	@GetMapping("/payPage")
	public ModelAndView pay(ModelAndView mav, Authentication authentication) {
		String id = authentication.getPrincipal().toString();
		mav.addObject("point", myPageService.getPoint(id));
		mav.addObject("member", securityService.getMember(id));
		mav.setViewName("/myPage/payPage");
		return mav;
	}

	// 결제 페이지 이동 (ajax)
	/*
	 * @PostMapping(value = "/payPage", produces = "application/json; charset=utf8")
	 * public List<CartVO> payPage(@RequestBody List<Map<String, Object>> param,
	 * ModelAndView mav) { log.info("/myPage/payPage"); List<CartVO> payGoods = new
	 * ArrayList<CartVO>(); CartVO cart = new CartVO(); for (Map<String, Object>
	 * goods : param) { cart.setBoard_id((int) goods.get("board_id"));
	 * cart.setAmount((int) goods.get("amount")); cart.setSum((int)
	 * goods.get("sum")); payGoods.add(cart); } System.out.println(payGoods); return
	 * payGoods; }
	 */

}
