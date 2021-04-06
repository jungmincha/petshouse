package com.pet.ex.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.pet.ex.mapper.AdminMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	public AdminMapper mapper;
	
	/* 상품관리 */
	
	@Override
	public List<GoodsVO> getList(Criteria cri) { 
	
		cri.setAmount(15);
		return mapper.getList(cri);
	}
	
	@Override
	public int getTotalGoods(Criteria cri) {

		return mapper.getTotalGoods(cri);
	}
	
	
	@Override
	public List<GoodsVO> getList2(int category_id) {
		/*
		 * log.info("List" + cri); cri.setAmount(20);
		 */
		return mapper.getList2(category_id);
	}
	
	@Override
	public List<CategoryVO> getCatengoods() {

		return mapper.getCatengoods();
	}
	
	@Override
	public List<CategoryVO> getSort(CategoryVO categoryVO) {

		return mapper.getSort(categoryVO);
	}
	
	@Override
	public GoodsVO getGoods(int goods_id) {

		return mapper.getGoods(goods_id);
	}
	
	@Override
	public List<StockVO> getStock() {

		return mapper.getStock();
	}
	
	@Override
	public List<CategoryVO> getCategory() {

		return mapper.getCategory();
	}

	@Override
	public void goodsInput(GoodsVO goodsVO) {		

		mapper.goodsInput(goodsVO);
	}
	
	@Override
	public void goodsModify(GoodsVO goodsVO) {
	
		mapper.goodsModify(goodsVO);
	}
	
	@Override
	public void goodsDelete(int goods_id) {
		
		/* mapper.reviewDelete(goods_id); */
		mapper.boardDelete(goods_id);
		mapper.goodsDelete(goods_id);
	}
	
//	@Override
//	public void fileUpload(String imgname) {
//		 
//		mapper.fileUpload(imgname);
//	}

	
	
	/* 상품게시글관리 */
	
	@Override
	public List<GoodsVO> getNboard() {
		log.info("getNboard");
		return mapper.getNboard();
	}
	
	@Override
	public void boardInput(BoardVO boardVO) {		

		mapper.boardInput(boardVO);
	}
	
	@Override
	public BoardVO getBoard(int board_id) {		
	
		return mapper.getBoard(board_id);
	}

	@Override
	public BoardVO getRateone(int goods_id) {

		return mapper.getRateone(goods_id);
	}

	@Override
	public BoardVO getboardInfo(int board_id) {
	 
		return mapper.getboardInfo(board_id);
	}

	@Override
	public List<CategoryVO> getsortBoard(CategoryVO categoryVO) {
	 
		return mapper.getsortBoard(categoryVO);
	}

	@Override
	public List<CategoryVO> getcateBoard() {
		 
	    return mapper.getcateBoard();
	}
	

	

	
	
	
	/* 회원관리 */
	@Override
	public List<MemberVO> getMemberlist(Criteria cri) {
		log.info("Memberlist");
		cri.setAmount(20);
		return mapper.getMemberlist(cri);
	}

	@Override
	public int getMembertotal() {
		log.info("getMembertotal");
		return mapper.getMembertotal();
	}

	@Override
	public MemberVO getMemberdetail(String member_id) {
		log.info("getMemberdetail");
		return mapper.getMemberdetail(member_id);
	}

	@Override
	public void memberDelete(String member_id) {
		log.info("memberDelete");
		mapper.memberDelete(member_id);
	}






	



}
