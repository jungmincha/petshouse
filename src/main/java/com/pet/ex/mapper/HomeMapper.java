package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;

@Mapper
public interface HomeMapper {

	//검색,더보기
	public List<BoardVO> getMoreGoods(String keyword, Criteria cri);
	public List<BoardVO> getMoreQna(String keyword, Criteria cri);
	public List<ImageVO> getMoreTips(String keyword, Criteria cri);


}
