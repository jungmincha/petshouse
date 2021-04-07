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

	public List<BoardVO> getSmallGoods(int getCategory_id);

	public List<BoardVO> getboard();

	public List<BoardVO> gethighprice();

	public List<BoardVO> getrowprice();

	public List<BoardVO> getshighprice(int category_id);



	public List<BoardVO> getStorerate();

	public List<BoardVO> gethighStar();

	public List<BoardVO> getrowSmallGoods(int category_id);

	public List<BoardVO> gethighSmallGoods(int category_id);

	public List<BoardVO> gethighstarGoods(int category_id);





	/* public List<BoardVO> getStorerate(); */





}
