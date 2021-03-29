package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {

	private int cart_id;
	private int orderstate;
	private int amount;
	
	//외래키
	private MemberVO memberVO;
	private GoodsVO goodsVO;
	private PayVO payVO;
	
}
