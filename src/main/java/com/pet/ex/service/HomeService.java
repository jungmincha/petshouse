package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;

public interface HomeService {
	
	// 상품 검색
	public List<GoodsVO> getGsearch(String keyword);
	
	// 노하우 검색 리스트 출력
	public List<BoardVO> getTsearch(String keyword);
	
	// 질문과 답변 검색 리스트 출력
	public List<BoardVO> getQsearch(String keyword);
	

}
