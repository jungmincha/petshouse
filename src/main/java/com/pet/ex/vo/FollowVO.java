package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FollowVO {

	private int follow_id;
	private String follower_id;
	
	//외래키
	private MemberVO memberVO;
	
}
