package com.pet.ex.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PayVO {

	private int pay_id;
	private int payprice;
	private int usepoint;
	private int earningpoint;
	private Timestamp paydate;
	private String deliveryaddress;
	private String deliveryname;
	private int deliverytel;
	private String receipt_id;
	private String goodsprice;

	// 외래키
	private PaystateVO paystateVO;
	private MemberVO memberVO;
	private List<PayGoodsVO> payGoodsVO;

}
