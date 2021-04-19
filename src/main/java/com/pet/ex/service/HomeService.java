package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;

public interface HomeService {
	
	// 상품 검색
	public List<BoardVO> getGsearch(String keyword);
	
	// 노하우 검색 리스트 출력
	public List<BoardVO> getTsearch(String keyword);
	
	// 질문과 답변 검색 리스트 출력
	public List<BoardVO> getQsearch(String keyword);
	

	//더보기
	public List<BoardVO> getMoreGoods(String keyword, Criteria cri);
	public List<BoardVO> getMoreQna(String keyword, Criteria cri);
	public List<BoardVO> getMoreTips(String keyword, Criteria cri);
	
	// 질문과 답변 페이징 처리 출력
	public int getTotal(Criteria cri);
}
