package com.pet.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.VisitorVO;

@Mapper
public interface VisitorMapper {
	

	

	public void setCount();

	//일별 매출액
		public Integer getDailyVisitor(String year, String month,String valueOf);
		//월별 매출액
		public Integer getMonthVisitor(String year, String valueOf);
		//연 매출액
		public int getYearVisitor(String year);

}
