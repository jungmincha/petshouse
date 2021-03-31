package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;

@Mapper
public interface CategoryMapper {

	/* public List<GoodsVO> getGoods(); */

	public List<CategoryVO> getCategory();

	public List<GoodsVO> getbigcategory(int getCategory_id);

	public List<CategoryVO> getScategory(CategoryVO categoryVO);

	public List<BoardVO> getSmallGoods();

	public List<BoardVO> getboard();





}
