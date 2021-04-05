package com.pet.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.CategoryService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/map")
public class MapController {
	
	@GetMapping("/home")
	public String map() {
		
	
		
		return "map/home";
	}

}
