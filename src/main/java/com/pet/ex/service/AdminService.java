package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
 

public interface AdminService {

 

	// 상품 조회
	public List<GoodsVO> getList(Criteria cri);	
	public int getTotalGoods(Criteria cri); 

	//카테고리별 상품조회
	public List<GoodsVO> getList2(int category_id);
	
	//카테고리
	public List<CategoryVO> getCatengoods();
	public List<CategoryVO> getSort(CategoryVO categoryVO);
	
	//상품 상세조회
	public GoodsVO getGoods(int goods_id);
	public List<StockVO> getStock();
	public List<CategoryVO> getCategory();

	//상품등록
	public void goodsInput(GoodsVO goodstVO);

	//상품수정
	public void goodsModify(GoodsVO goodsVO);

	//상품삭제/상품게시글삭제/리뷰삭제 
	public void goodsDelete(int goods_id);

	//상품 게시글 등록
	public  List<GoodsVO> getNboard();
	public void boardInput(BoardVO boardVO);
//	public void fileUpload(String imgname);
	
	
	
	
	
	
	//상품 게시글 상세조회
	public BoardVO getBoard(int board_id);
	public BoardVO getRateone(int goods_id);
	public BoardVO getboardInfo(int board_id);
	public List<CategoryVO> getsortBoard(CategoryVO categoryVO);
	public List<CategoryVO> getcateBoard();
	
	
	
	//회원 목록 조회
	public List<MemberVO> getMemberlist(Criteria cri);
	public int getMembertotal();
	
	//회원 상세 조회
	public MemberVO getMemberdetail(String member_id);
	
	//회원 삭제
	public void memberDelete(String member_id);

	

	
	

}
