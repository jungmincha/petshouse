package com.pet.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GoodsVO {

	private int goods_id;
	private String goodsname;
	// int형에서 String으로 변경, price 문자형태로 변환하여 불러오기 위함
	private String price;
	private String description;
	private String psize;
	private String pcolor;
	private String thumbnail;
	private String image3d;

	// 외래키
	private StockVO stockVO;

	private CategoryVO categoryVO;

	// 리뷰 총개수 출력
	private int count;

	// storehome에서 best번호
	private int rnum;

	
	
}
