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
public class PlikeVO {

	private int plike_id; //기본키
	private int count; //전체 좋아요 수 파악

	// 외래키
	private MemberVO memberVO;
	private BoardVO boardVO;
	



}
