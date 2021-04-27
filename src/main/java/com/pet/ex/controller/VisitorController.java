package com.pet.ex.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.service.StatisticsService;
import com.pet.ex.service.VisitorService;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@RestController
@RequestMapping("/visitor")
public class VisitorController {


	@Autowired
	private VisitorService visitorService;

	@GetMapping("/main/home")
	public ModelAndView visitorStat(ModelAndView mav)throws Exception {

		
		SimpleDateFormat yy = new SimpleDateFormat("yyyy");
		SimpleDateFormat mm = new SimpleDateFormat("MM"); 
		SimpleDateFormat dd = new SimpleDateFormat("dd");

		Date time = new Date(); 


		String year = yy.format(time);
	
		String month = mm.format(time);
		
		String day = dd.format(time);

		log.info("오늘날짜: " + year + "년 " + month + "월 " + day + "일");

		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);

		mav.addObject("dailyVisitor", visitorService.getDailyVisitor(year, month)); // 일별
		mav.addObject("monthVisitor", visitorService.getMonthVisitor(year)); // 월별
		mav.addObject("yearVisitor", visitorService.getYearVisitor(year)); // 년별
		
	

		log.info("년별통계 금액: " + visitorService.getYearVisitor(year));
		mav.setViewName("statistics/visitor_home");

		return mav;
	}
	
	@GetMapping("/temp")
	@ResponseBody
	public Map<Integer, Integer> temp(@RequestParam(value = "month") Integer month) {
		log.info("month : " + month); 
		return visitorService.getDailyVisitor("2021", String.valueOf(month));
	}



	
	

	

	



}
