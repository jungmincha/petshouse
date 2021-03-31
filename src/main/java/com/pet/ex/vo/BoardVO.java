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
public class BoardVO {

	private int board_id;
	private String title;
	private String content;
	private Timestamp pdate;
	private int plike;
	private int hit;
	private String hashtag;
	private int pgroup;
	private int pstep;
	private int pindent;
	private int ratescore;
	
	//외래키
	private MemberVO memberVO;
	private BoardtypeVO boardtypeVO;
	private GoodsVO goodsVO;
	private CategoryVO categoryVO;
	
	//별점 평균
	private double avgscore;
	//카운트 세기
	private int count;
	
	
}
