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
			
				public Map<Integer, Integer> getDailyVisitor(String year, String month) {
					System.out.println("ddddd");
					Calendar cal = Calendar.getInstance();
			        cal.set(Integer.parseInt(year), Integer.parseInt(month), 1);
					
					Map<Integer, Integer> dailyVisitor = new HashMap<>();
					
					for(int i=1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
						dailyVisitor.put(i, visitorMapper.getDailyVisitor(year, month, String.valueOf(i)));
					}
					
					return dailyVisitor;
				}
			
			
			//월별 매출액
		
			public Map<Integer, Integer> getMonthVisitor(String year) {
				
				Map<Integer, Integer> monthVisitor = new HashMap<>();
				
				for(int i= 1; i <13; i++) {
					monthVisitor.put(i, visitorMapper.getMonthVisitor(year, String.valueOf(i)));
				}
				
				return monthVisitor; 
			}
			
			
			//연 매출액
		
			public int getYearVisitor(String year) {
				
				return visitorMapper.getYearVisitor(year);
			}
			
			
}
