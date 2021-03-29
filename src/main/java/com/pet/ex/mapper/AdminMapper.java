package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
 
@Mapper
public interface AdminMapper {

	 

	public GoodsVO getGoods(int goods_id);

	public BoardVO getRateone(int goods_id);

	public List<GoodsVO> getList(Criteria cri);
	public int getTotalCount(Criteria cri);

	public void remove(int goods_id);

	public List<StockVO> getStock();

	public List<CategoryVO> getCategory();

	public void input(GoodsVO goodsVO);

	public GoodsVO getBoard(int goods_id);

	public void modifyGoods(GoodsVO goodsVO);

	public BoardVO getgoodsInfo(int g_id);

	public GoodsVO getInfo(int gId);
	
	

}
