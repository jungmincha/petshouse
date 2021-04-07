package com.pet.ex.service;

import java.util.List; 

import org.springframework.stereotype.Service;


import com.pet.ex.mapper.CategoryMapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;

import lombok.AllArgsConstructor;


import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		log.info("getbigcategory...");
		return mapper.getbigcategory(getCategory_id);
	}

	@Override
	public List<CategoryVO> getScategory(CategoryVO categoryVO) {
		log.info("getScategory...");
		return mapper.getScategory(categoryVO);
	}

	@Override
	public List<BoardVO> getSmallGoods(int getCategory_id) {
	
		log.info("getSmallGoods...");
		
		return mapper.getSmallGoods(getCategory_id);
	}

	@Override
	public List<BoardVO> getboard() {
		log.info("getboard...");
		return mapper.getboard();
	}

	@Override
	public List<BoardVO> gethighprice() {
		log.info("gethighprice...");
		return mapper.gethighprice();
	
	}

	@Override
	public List<BoardVO> getrowprice() {
		log.info("getrowprice...");
		return mapper.getrowprice();
	}

	@Override
	public List<BoardVO> getshighprice(int category_id) {
		
		
		
		log.info("getshighprice(...");
		return mapper.getshighprice(category_id);
	}

	@Override
	public List<BoardVO> getStorerate() {
		log.info("getStorerate(...");
		return mapper.getStorerate();
	}

	@Override
	public List<BoardVO> gethighStar() {
		log.info("gethighStar(...");
		return mapper.gethighStar();
	}

	@Override
	public List<BoardVO> getrowSmallGoods (int category_id) {
		
		
		
		
		return mapper.getrowSmallGoods(category_id);
	}

	


	

	/*
	 * @Override public List<BoardVO> getStorerate() {
	 * 
	 * return mapper.getStorerate(); }
	 * 
	 */
	
	
	
	

	

}
