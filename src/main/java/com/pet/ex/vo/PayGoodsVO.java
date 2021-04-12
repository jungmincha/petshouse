package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PayGoodsVO {

	public PayGoodsVO() {
		this.boardVO = new BoardVO();
	}

	private int amount;
	private String pcolor;
	private String psize;

	// 외래키
	private int pay_id;
	private BoardVO boardVO;
}
