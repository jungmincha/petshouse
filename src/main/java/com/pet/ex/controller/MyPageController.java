package com.pet.ex.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.pet.ex.service.MyPageService;
import com.pet.ex.service.SecurityService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PayVO;

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

	// 결제 후 결제 정보 삽입
	@PostMapping("/payPage/insert")
	public ModelAndView insertPay(ModelAndView mav, PayVO pay, HttpServletRequest request) {
		String[] amounts = request.getParameterValues("amount");
		String[] board_ids = request.getParameterValues("board_id");
		System.out.println(amounts[1]);
		System.out.println(board_ids[1]);
		System.out.println("이름 : " + pay.getDeliveryname());
		System.out.println("주소 : " + pay.getDeliveryaddress());
		System.out.println("전화번호 : " + pay.getDeliverytel());
		System.out.println("적립포인트 : " + pay.getEarningpoint());
		System.out.println("결제 금액 : " + pay.getPayprice());
		System.out.println("사용 포인트 : " + pay.getUsepoint());
		mav.setViewName("/home/home");
		return mav;
	}

}
