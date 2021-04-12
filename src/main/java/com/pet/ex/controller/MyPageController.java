package com.pet.ex.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.MyPageService;
import com.pet.ex.service.SecurityService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PayGoodsVO;
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

	// 결제 페이지 이동
	@GetMapping("/payPage")
	public ModelAndView pay(ModelAndView mav, Authentication authentication) {
		String id = authentication.getPrincipal().toString();
		mav.addObject("point", myPageService.getPoint(id));
		mav.addObject("member", securityService.getMember(id));
		mav.setViewName("/myPage/payPage");
		return mav;
	}

	// 결제 후 결제 정보 삽입
	@PostMapping("/payPage/insert")
	public ModelAndView insertPay(ModelAndView mav, PayVO pay, HttpServletRequest request) {
		log.info("/payPage/insert");
		String[] amounts = request.getParameterValues("amount");
		String[] board_ids = request.getParameterValues("board_id");
		String[] psizes = request.getParameterValues("psize");
		String[] pcolors = request.getParameterValues("pcolor");
		myPageService.insertPay(pay);

		// 해당아이디의 최신 결제내역을 가져옴
		PayVO payVO = myPageService.getPay_id(pay.getMemberVO().getMember_id());

		// payGoods에 정보 저장
		PayGoodsVO payGoodsVO = new PayGoodsVO();

		for (int i = 1; i < amounts.length; i++) {
			payGoodsVO.setAmount(Integer.parseInt(amounts[i]));
			payGoodsVO.setPcolor(pcolors[i]);
			payGoodsVO.setPsize(psizes[i]);
			payGoodsVO.getBoardVO().setBoard_id(Integer.parseInt(board_ids[i]));
			payGoodsVO.setPay_id(payVO.getPay_id());
			myPageService.insertPayGoods(payGoodsVO);

		}

		mav.setViewName("/myPage/paySuccess");
		return mav;
	}

	// 주문 배송 내역 조회
	@GetMapping("/orderList")
	public ModelAndView orderList(ModelAndView mav, Authentication authentication) {
		String member_id = authentication.getPrincipal().toString();
		List<Integer> payCounts = new ArrayList<Integer>();
		payCounts.add(myPageService.getPayTotal(member_id));
		payCounts.add(myPageService.orderListCount(1,member_id));
		payCounts.add(myPageService.orderListCount(2,member_id));
		payCounts.add(myPageService.orderListCount(3,member_id));
		payCounts.add(myPageService.orderListCount(4,member_id));
		payCounts.add(myPageService.orderListCount(5,member_id));
		mav.addObject("payCounts", payCounts);
		mav.setViewName("/myPage/orderList");
		return mav;
	}

	// 전체 주문 리스트 조회
	@GetMapping("/orderList/ajax")
	public Map<String, Object> orderListAjax(Criteria cri, Authentication authentication) {
		String member_id = authentication.getPrincipal().toString();
		List<PayVO> pay = new ArrayList<PayVO>();
		Map<String, Object> payAjax = new HashMap<String, Object>();

		pay = myPageService.listOrder(cri, member_id);
		System.out.println(pay);
		int total = myPageService.getPayTotal(member_id);

		for (PayVO dto : pay) {
			dto.setPayGoodsVO(myPageService.listPayGoods(dto.getPay_id()));

		}

		payAjax.put("pay", pay);
		payAjax.put("pageMaker", new PageVO(cri, total));
		return payAjax;
	}

	// paystate별 주문 리스트 조회
	@GetMapping("/orderList/ajax/{paystate_id}")
	public Map<String, Object> orderList(Criteria cri, Authentication authentication,
			@PathVariable("paystate_id") String paystate_id) {
		String member_id = authentication.getPrincipal().toString();
		List<PayVO> pay = new ArrayList<PayVO>();
		Map<String, Object> payAjax = new HashMap<String, Object>();

		pay = myPageService.listPaystateOrder(cri, member_id, paystate_id);
		System.out.println(pay);
		int total = myPageService.getPayTotal(member_id);

		for (PayVO dto : pay) {
			dto.setPayGoodsVO(myPageService.listPayGoods(dto.getPay_id()));
			System.out.println();
		}

		payAjax.put("pay", pay);
		payAjax.put("pageMaker", new PageVO(cri, total));
		return payAjax;
	}
}
