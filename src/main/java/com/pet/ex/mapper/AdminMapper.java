package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;

@Mapper
public interface AdminMapper {
	
	/* 상품관리 */
	public List<GoodsVO> getList(Criteria cri);
	
	public int getTotalGoods(Criteria cri);
	
	public List<GoodsVO> getList2(int category_id);
	
	public List<CategoryVO> getCatengoods();
	
	public List<CategoryVO> getSort(CategoryVO categoryVO);
	
	public GoodsVO getGoods(int goods_id);
	
	public List<StockVO> getStock();
	
	public List<CategoryVO> getCategory();
	
	public void goodsInput(GoodsVO goodsVO);
	
	public void goodsModify(GoodsVO goodsVO);

	/* public void reviewDelete(int goods_id); */

	public void boardDelete(int goods_id);

	public void goodsDelete(int goods_id);

	
	/* 상품게시글관리 */
	public List<GoodsVO> getNboard();
	
	public void boardInput(BoardVO boardVO);

	public void detailInput(ImageVO imageVO);
	
	public BoardVO getboardInfo(int board_id);

	public BoardVO getBoard(int board_id);

	public List<ImageVO> getImg(int goods_id);
	
	public BoardVO getRateone(int goods_id);

	public List<CategoryVO> getcateBoard();

	public List<CategoryVO> getsortBoard(CategoryVO categoryVO);
	
	


	


 
	
	/* 회원관리 */
	public List<MemberVO> getMemberlist(Criteria cri);

	public int getMembertotal();

	public MemberVO getMemberdetail(String member_id);

	public void memberDelete(String member_id);

	public List<String> getGoodsSize(int goods_id);

	public void updateCheck(BoardVO boardVO);
 


	




	

	



}
