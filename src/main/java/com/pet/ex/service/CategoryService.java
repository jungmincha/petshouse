package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;

public interface CategoryService {

	public List <GoodsVO>getGoods();


	
	public List<CategoryVO> getCategory();

	

	public List<GoodsVO> getbigcategory(int getCategory_id);



	public List<CategoryVO> getScategory(CategoryVO categoryVO);



	public List <GoodsVO> getSmallGoods(int getCategory_id);  

	



	

}
