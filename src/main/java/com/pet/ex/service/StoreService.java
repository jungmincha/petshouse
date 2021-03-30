package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.StockVO;

public interface StoreService {

	public StockVO getStock2(int getStock_id); // 상품조회/재고

	public GoodsVO getGoods2(int getGoods_id);
	
	public List<BoardVO> getStorerate();

	public List<BoardVO> getGoodsinfo();
	
	//public List<BoardVO> getBestrate();

	//public List<BoardVO> getBestrate(int category_id);

}
