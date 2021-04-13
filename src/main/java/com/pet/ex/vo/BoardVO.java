package com.pet.ex.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class BoardVO {

	public BoardVO() {
		this.memberVO = new MemberVO();
		this.boardtypeVO = new BoardtypeVO();
		this.goodsVO = new GoodsVO();
		this.categoryVO = new CategoryVO();
	}

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
	private String location;
	private String thumbnail;
	// 외래키
	private MemberVO memberVO;
	private BoardtypeVO boardtypeVO;
	private GoodsVO goodsVO;
	private CategoryVO categoryVO;

	// 별점 평균
	private double avgscore;

	// 카운트 세기
	private int count;

	// 순서대로 정렬
	private int rnum;

}
