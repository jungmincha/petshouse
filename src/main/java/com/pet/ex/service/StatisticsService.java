package com.pet.ex.service;

import java.util.List;
import java.util.Map;

import com.pet.ex.vo.PayVO;

public interface StatisticsService {

	


	// 일별 매출액 통계		
	 Map<Integer, Integer> getDailySales(String year, String month);
	// 월별 매출액 통계		
	 Map<Integer, Integer> getMonthSales(String year);
	// 연 매출액 통계		
	 int getYearSales(String year);
	
}
