package com.pet.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.SnsService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
@RequestMapping("/commu")
public class SnsController {

	@Autowired
	private SnsService service;

	@GetMapping("/index")
	public ModelAndView index(ModelAndView mav) throws Exception {

		log.info("index");
		mav.setViewName("sns/index");

		return mav;
	}
	
	
}
