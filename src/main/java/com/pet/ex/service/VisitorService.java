package com.pet.ex.service;


import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.VisitorMapper;




import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@Service
public class VisitorService {
	
	VisitorMapper visitorMapper;
	
	

	// 방문자수 insert
		public void setCount() {


			visitorMapper.setCount();

		}



		//일별 매출액
			
				public Map<Integer, Integer> getDailySales(String year, String month) {
					System.out.println("ddddd");
					Calendar cal = Calendar.getInstance();
			        cal.set(Integer.parseInt(year), Integer.parseInt(month), 1);
					
					Map<Integer, Integer> dailySale = new HashMap<>();
					
					for(int i=1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
						dailySale.put(i, visitorMapper.getDailySale(year, month, String.valueOf(i)));
					}
					
					return dailySale;
				}
			
			
			//월별 매출액
		
			public Map<Integer, Integer> getMonthSales(String year) {
				
				Map<Integer, Integer> monthSale = new HashMap<>();
				
				for(int i= 1; i <13; i++) {
					monthSale.put(i, visitorMapper.getMonthSale(year, String.valueOf(i)));
				}
				
				return monthSale; 
			}
			
			
			//연 매출액
		
			public int getYearSales(String year) {
				
				return visitorMapper.getYearSale(year);
			}
			
			
}
