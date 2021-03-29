package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TagVO {

	private int tag_id;
	private String goodsname;
	private String goodspath;
	
	//외래키
	private BoardVO boardVO;
	
}
