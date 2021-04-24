package com.pet.ex.controller;

import java.io.File; 
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.service.AdminService;
import com.pet.ex.service.FileService;
import com.pet.ex.service.StatisticsService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.security.handlers.MyAuthentication;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

//
@Slf4j
@RestController
@RequestMapping("/statistics")
public class StatisticsController {

	@Autowired
	private StatisticsService statisticService;

	@GetMapping("/main/home")
	public ModelAndView adminDonationStat(ModelAndView mav)throws Exception {

		
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

		mav.addObject("dailySale", statisticService.getDailySales(year, month)); // 일별
		mav.addObject("monthSale", statisticService.getMonthSales(year)); // 월별
		mav.addObject("yearSale", statisticService.getYearSales(year)); // 년별
		
		mav.addObject("json_dailySale", JSONArray.fromObject(statisticService.getDailySales(year, month)));
		mav.addObject("json_monthSale", JSONArray.fromObject(statisticService.getMonthSales(year)));
		mav.addObject("json_yearSale", JSONArray.fromObject(statisticService.getYearSales(year)));
		
		

		log.info("년별통계 금액: " + statisticService.getYearSales(year));
		mav.setViewName("statistics/home");

		return mav;
	}


	
		

	}

