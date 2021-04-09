package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.PointVO;

public interface StoreService {
	public List<BoardVO> getStorerate();
	
	public List<BoardVO> getStorerate(Criteria cri);
	
	public int getStoretotal();

	public List<BoardVO> getGoodsinfo();

	public List<BoardVO> getBestrate(int category_id);

	public List<CategoryVO> getCategory();
	
	public void point(PointVO pointVO);

	//community 
	//노하우 조회
	public List<BoardVO> getKnowhow();
	
	//sns 조회
	public List<BoardVO> getSns();

}
