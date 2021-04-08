package com.pet.ex.vo;

import java.sql.Timestamp;

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

	// 외래키
	private PaystateVO paystateVO;
	private MemberVO memberVO;

}
