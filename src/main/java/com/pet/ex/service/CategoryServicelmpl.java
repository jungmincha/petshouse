package com.pet.ex.service;

import java.util.List; 

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.CategoryMapper;
import com.pet.ex.mapper.StoreMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class CategoryServicelmpl implements CategoryService {

	CategoryMapper mapper;
	
	/*
	 * @Override public List<GoodsVO> getGoods() {
	 * 
	 * return mapper.getGoods(); }
	 */

	@Override
	public List<CategoryVO> getCategory() {
		
		return mapper.getCategory();
	}

	@Override
	public List<GoodsVO> getbigcategory(int getCategory_id) {

		return mapper.getbigcategory(getCategory_id);
	}

	@Override
	public List<CategoryVO> getScategory(CategoryVO categoryVO) {

		return mapper.getScategory(categoryVO);
	}

	@Override
	public List<CategoryVO> getSmallGoods(int getCategory_id) {
	
		
		return mapper.getSmallGoods(getCategory_id);
	}

	@Override
	public List<BoardVO> getboard() {
		
		return mapper.getboard();
	}

	@Override
	public List<BoardVO> gethighprice() {
		return mapper.gethighprice();
	
	}

	/*
	 * @Override public List<BoardVO> getStorerate() {
	 * 
	 * return mapper.getStorerate(); }
	 * 
	 */
	
	
	
	

	

}
