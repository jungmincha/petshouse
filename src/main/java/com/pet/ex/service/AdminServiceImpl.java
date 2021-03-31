package com.pet.ex.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.pet.ex.mapper.AdminMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
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
	public void input(GoodsVO goodsVO) {

		log.info("inpput");
		log.info("" + goodsVO);

		mapper.input(goodsVO);

	}

	@Override
	public BoardVO getGoods(int board_id) {
		log.info("getGoods");
		return mapper.getGoods(board_id);
	}

	@Override
	public BoardVO getRateone(int goods_id) {

		return mapper.getRateone(goods_id);
	} 

	@Override
	public List<GoodsVO> getList(Criteria cri) {		// 상품 목록 + 페이징처리
		log.info("List" + cri);
		cri.setAmount(20);
		return mapper.getList(cri);
	}

	
	@Override
	public int getTotal(Criteria cri) {					// 상품 갯수
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

 
}
