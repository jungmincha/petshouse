package com.pet.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.MyhomeService;

import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/myPage")
public class Myhomecontroller {

	@Autowired
	private MyhomeService service;

	@GetMapping("/{nickname}")
	public ModelAndView myPageHome(@PathVariable("nickname") String nickname, MemberVO memberVO, ModelAndView mav)
			throws Exception {

		memberVO = service.getNicknameInfo(nickname);
		log.info("nickname");

		mav.addObject("user", service.getUser(memberVO.getNickname()));

		mav.setViewName("myPage/Home");

		return mav;
	}

}
