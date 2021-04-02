package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
 
@Mapper
public interface AdminMapper {

	 

	public BoardVO getGoods(int board_id);

	public BoardVO getRateone(int goods_id);

	public List<GoodsVO> getList(Criteria cri);
	public int getTotalCount(Criteria cri);

	
	public void remove_goodsBoard(int goods_id);
	
	public void remove_goods(int goods_id);
	
	

	public List<StockVO> getStock();

	public List<CategoryVO> getCategory();

	public void input(GoodsVO goodsVO);

	public GoodsVO getBoard(int goods_id);

	public void modifyGoods(GoodsVO goodsVO);

	public BoardVO getgoodsInfo(int board_id);
 
	public GoodsVO getInfo(int goods_id);

	public List<MemberVO> getMemberlist(Criteria cri);

	public int getMembertotal();

	public MemberVO getMemberdetail(String member_id);

	public void memberDelete(String member_id);
	
	public List<CategoryVO> getCategory_goods();

	public List<CategoryVO> getSort(CategoryVO categoryVO);

	public List<GoodsVO>  getList2(Criteria cri);
 
	
}
