package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.StockVO;

@Mapper
public interface StoreMapper {

	public StockVO getStock2(int stock_id);

	public GoodsVO getGoods2(int goods_id);
	
	public List<BoardVO> getStoreinfo();

	public List<BoardVO> getRatescore();

	public List<GoodsVO> getBestinfo();
	
	public List<GoodsVO> getBestlist(int category_id);

}
