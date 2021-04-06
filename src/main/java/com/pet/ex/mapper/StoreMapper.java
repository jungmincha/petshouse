package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;

@Mapper
public interface StoreMapper {
	public List<BoardVO> getStore();
	
	public List<BoardVO> getStorerate(Criteria cri);
	
	public int getStoretotal();

	public List<BoardVO> getGoodsinfo();
	
	public List<BoardVO> getBestrate(int category_id);
	
	public List<CategoryVO> getCategory();

	//commu
	public List<BoardVO> getKnowhow();

	public List<BoardVO> getSns();
}
