package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.BoardVO;

public interface StoreService {
	public List<BoardVO> getStorerate();

	public List<BoardVO> getGoodsinfo();

	public List<BoardVO> getBestrate(int category_id);
	
}
