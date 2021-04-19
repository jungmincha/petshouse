package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;

@Mapper
public interface HomeMapper {
	
	// 상품  검색
	public List<BoardVO> getGsearch(String keyword);
	
	// 노하우 글 검색
	public List<BoardVO> getTsearch(String keyword);
	
	// 질문과 답변 글 검색
	public List<BoardVO> getQsearch(String keyword);
	
	//더보기
	public List<BoardVO> getMoreGoods(String keyword, Criteria cri);
	public List<BoardVO> getMoreQna(String keyword, Criteria cri);
	public List<BoardVO> getMoreTips(String keyword, Criteria cri);
	// 질문과 답변 페이징 처리 출력
	public int getTotal(Criteria cri);

}
