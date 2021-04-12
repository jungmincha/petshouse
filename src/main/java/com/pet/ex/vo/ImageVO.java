package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter; 
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ImageVO {

	public ImageVO() {
		this.boardVO = new BoardVO();
		this.goodsVO = new GoodsVO();
 
	}
 
	private int img_id;
	private String imgname;
	
	//외래키
	private BoardVO boardVO;
	private GoodsVO goodsVO;

}
