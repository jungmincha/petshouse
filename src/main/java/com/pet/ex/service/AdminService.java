package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
 

public interface AdminService {

 

	public BoardVO getGoods(int board_id);

	public BoardVO getRateone(int goods_id);

	public List<GoodsVO> getList(Criteria cri);	// 상품 목록 조회
	public int getTotal(Criteria cri);			// 상품 갯수
	
	public void remove_goods(int goods_id);

	public List<CategoryVO> getCategory();

	public List<StockVO> getStock();

	public void input(GoodsVO goodstVO);

	public GoodsVO getBoard(int goods_id);

	public void modifyGoods(GoodsVO goodsVO);

	public BoardVO getgoodsInfo(int board_id);

	public GoodsVO getInfo(int goods_id);

	public List<MemberVO> getMemberlist(Criteria cri);

	public int getMembertotal();

	public MemberVO getMemberdetail(String member_id);

	public void memberDelete(String member_id);

}
