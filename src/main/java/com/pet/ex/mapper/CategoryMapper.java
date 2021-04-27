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

	public List<CategoryVO> getScategory();

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
	//가격 낮은순(별점 리뷰 포함)
	public List<BoardVO> getStoreRowrate();
	//가격 높은순(별점 리뷰 포함)
	public List<BoardVO> getStoreHighrate();
	//카테고리(별점 리뷰 포함)
	public List<BoardVO> getStoreSmallrate(int getCategory_id);
	//소분류 가격 낮은거 부터 조회(별점 리뷰 포함)
	public List<BoardVO> getSmallPriceRowrate(int category_id);
	//소분류 가격 높은거 부터 조회(별점 리뷰 포함)
	public List<BoardVO> getSmallPriceHightrate(int category_id);
	//소분류 별점순(별점 리뷰 포함)
	public List<BoardVO> getSmallhighStar(int category_id);
	//리뷰  많은순(별점 리뷰 포함)
	public List<BoardVO> gethighReview();
	//소분류 리뷰  많은순(별점 리뷰 포함)
	public List<BoardVO> getSmallhighReview(int category_id);







}
