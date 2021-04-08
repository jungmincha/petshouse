package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PayGoodsVO {
	
	public PayGoodsVO() {
		this.payVO = new PayVO();
		this.boardVO = new BoardVO();
	}

	private int amount;
	private String pcolor;
	private String psize;

	// 외래키
	private PayVO payVO;
	private BoardVO boardVO;
}
