package com.pet.ex.page;

import com.pet.ex.vo.MemberVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString


public class Criteria {
	private int pageNum;
	private int amount;
	//외래키
	
	private String location;
 
	public Criteria() {
		this(1, 10);

	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}