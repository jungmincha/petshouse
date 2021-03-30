package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.StoreMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.StockVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

	public StoreMapper mapper;

	@Override
	public StockVO getStock2(int Stock_id) {
		
		return mapper.getStock2(Stock_id);
	}

	@Override
	public GoodsVO getGoods2(int Goods_id) {
		
		return mapper.getGoods2(Goods_id);
	}

	@Override
	public List<BoardVO> getStoreinfo() {
		log.info("getStoreinfo");
		return mapper.getStoreinfo();
	}

	@Override
	public List<BoardVO> getRatescore() {
		log.info("getRatescore");
		return mapper.getRatescore();
	}

	@Override
	public List<GoodsVO> getBestinfo() {
		log.info("getBestlist");
		return mapper.getBestinfo();
	}
	
	@Override
	public List<GoodsVO> getBestlist(int category_id) {
		log.info("getBestlist");
		return mapper.getBestlist(category_id);
	}

}
