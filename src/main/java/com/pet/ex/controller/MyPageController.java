package com.pet.ex.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.MyPageService;
import com.pet.ex.vo.BoardVO;

@RestController
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	MyPageService myPageService;

	// 장바구니 목록 페이지 이동
	@GetMapping("/cart")
	public ModelAndView cart(ModelAndView mav, HttpServletRequest request, HttpSession session) {

		mav.setViewName("/myPage/cart");
		return mav;

	}

	@PostMapping("/cartList")
	public List<BoardVO> cartList(@RequestParam(value = "cartList[]") List<String> cartList) {
		List<BoardVO> board = new ArrayList<BoardVO>();
		for (String i : cartList) {

			board.add(myPageService.getBoard(Integer.parseInt(i)));
		}
		System.out.println(board);
		return board;

	}

	@GetMapping("cartTest")
	public ModelAndView cartTest(ModelAndView mav) {

		mav.setViewName("/myPage/cartTest");
		return mav;

	}
}
