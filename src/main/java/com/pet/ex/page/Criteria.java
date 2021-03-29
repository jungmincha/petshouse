package com.pet.ex.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class Criteria {
	private int pageNum;
	private int amount;
	
    //리뷰를 5개씩 출력하려고 1,5로 설정했음
	public Criteria() {
		this(1, 5);

	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}