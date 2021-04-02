package com.pet.ex.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pet.ex.service.MyPageService;
import com.pet.ex.vo.BoardVO;

import net.sf.json.JSONObject;

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
	/*
	 * @PostMapping("/cartList") public List<BoardVO> cartList(Map<String, Object>
	 * params) { List<BoardVO> board = new ArrayList<BoardVO>();
	 * System.out.println(params); // for (String i : cartList) {
	 * 
	 * // board.add(myPageService.getBoard(Integer.parseInt(i))); // }
	 * System.out.println(board); return board;
	 * 
	 * }
	 */

	@RequestMapping(value = "/cartList", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public List<BoardVO> cartList2(@RequestBody List<Map<String, Object>> param) {

		List<BoardVO> board = new ArrayList<BoardVO>();
		System.out.println();

		for (Map<String, Object> cart : param) {
			board.add(myPageService.getBoard((String) cart.get("board_id")));
		}
		return board;

	}

	@GetMapping("cartTest")
	public ModelAndView cartTest(ModelAndView mav) {

		mav.setViewName("/myPage/cartTest");
		return mav;

	}
}
