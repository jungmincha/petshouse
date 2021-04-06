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
public class PointVO {

	private int point_id;
	private int pscore;
	private Timestamp pdate;

	// 외래키
	private PointtypeVO pointtypeVO;
	private MemberVO memberVO;

	// 합
	private int sum;

}
