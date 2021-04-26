package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;

public interface HomeService {
	

	//검색과 더보기
	public List<BoardVO> getMoreGoods(String keyword, Criteria cri);
	public List<BoardVO> getMoreQna(String keyword, Criteria cri);
	public List<ImageVO> getMoreTips(String keyword, Criteria cri);
	public List<ImageVO> getMoreSns(String keyword, Criteria cri);
	//검색 결과
	public int qcount(String keyword);
	public int tcount(String keyword);
	public int gcount(String keyword);
	public int scount(String keyword);

	public List<BoardVO> getStorerate(Criteria cri);
	public List<BoardVO> countComment(BoardVO boardVO);
	
	//상품 페이지용
	public List<BoardVO> getGoodsCount(String keyword);
	//sns 페이징용 
	public List<BoardVO> getSnsCount(String keyword);
	//sns 페이징용 
	public List<BoardVO> getTipsCount(String keyword);
	


}
