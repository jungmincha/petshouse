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

	@Override
	public void input(GoodsVO goodsVO) {		// 상품입력

		log.info("inpput");
		log.info("" + goodsVO);

		mapper.input(goodsVO);

	}

	@Override
	public BoardVO getGoods(int board_id) {		//
		log.info("getGoods");
		return mapper.getGoods(board_id);
	}

	@Override
	public BoardVO getRateone(int goods_id) {

		return mapper.getRateone(goods_id);
	}

	@Override
	public List<GoodsVO> getList(Criteria cri) { // 상품 목록 + 페이징처리
		log.info("List");
		cri.setAmount(15);
		return mapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) { // 상품 갯수
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

	@Override
	public void remove_goods(int goods_id) {
		log.info("Board deleted");
		mapper.remove_goodsBoard(goods_id);
		mapper.remove_goods(goods_id);
	}

	@Override
	public List<CategoryVO> getCategory() {

		return mapper.getCategory();
	}

	@Override
	public List<StockVO> getStock() {

		return mapper.getStock();
	}

	@Override
	public GoodsVO getBoard(int goods_id) {

		return mapper.getBoard(goods_id);
	}

	@Override
	public void modifyGoods(GoodsVO goodsVO) {
		log.info("modified");
		mapper.modifyGoods(goodsVO);
	}

	@Override
	public BoardVO getgoodsInfo(int board_id) {

		return mapper.getgoodsInfo(board_id);
	}

	public GoodsVO getInfo(int goods_id) {

		return mapper.getInfo(goods_id);
	}
	
	@Override
	public List<CategoryVO> getCategory_goods() {

		return mapper.getCategory_goods();
	}

	@Override
	public List<CategoryVO> getSort(CategoryVO categoryVO) {

		return mapper.getSort(categoryVO);
	}

	@Override
	public List<GoodsVO> getList2(int category_id) {
		/*
		 * log.info("List" + cri); cri.setAmount(20);
		 */
		return mapper.getList2(category_id);
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

	@Override
	public List<GoodsVO> getNboard() {
		log.info("getNboard");
		return mapper.getNboard();
	}



}
