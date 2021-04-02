package com.pet.ex.service;

import java.util.List; 

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.CategoryMapper;
import com.pet.ex.mapper.StoreMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log
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
		log.info("getCategory...");
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

	@Override
	public List<BoardVO> getrowprice() {
		
		return mapper.getrowprice();
	}

	@Override
	public List<BoardVO> getshighprice(int category_id) {
		// TODO Auto-generated method stub
		return mapper.getshighprice(category_id);
	}

	@Override
	public List<BoardVO> getStorerate() {
	
		return mapper.getStorerate();
	}

	@Override
	public List<BoardVO> gethighStar() {
		// TODO Auto-generated method stub
		return mapper.gethighStar();
	}

	


	

	/*
	 * @Override public List<BoardVO> getStorerate() {
	 * 
	 * return mapper.getStorerate(); }
	 * 
	 */
	
	
	
	

	

}
