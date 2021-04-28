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
	public List<CategoryVO> getScategory() {
		log.info("getScategory...");
		return mapper.getScategory();
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

	@Override
	public List<BoardVO> gethighSmallGoods(int category_id) {
		// TODO Auto-generated method stub
		return mapper.gethighSmallGoods(category_id);
	}

	@Override
	public List<BoardVO> gethighstarGoods(int category_id) {
		// TODO Auto-generated method stub
		return mapper.gethighstarGoods(category_id);
	}
	
	//가격 낮은순(별점 리뷰 포함)
	@Override
	public List<BoardVO> getStoreRowrate() {
		log.info("getStoreRowrate()...");
		return mapper.getStoreRowrate();
	}
	//가격 높은순(별점 리뷰 포함)
	@Override
	public List<BoardVO> getStoreHighrate() {
		log.info("getStoreHighrate()...");
		return mapper.getStoreHighrate();
	}
	//카테고리별 조회(별점 리뷰 포함)
	@Override
	public List<BoardVO> getStoreSmallrate(int getCategory_id) {
		log.info("getStoreSmallrate()...");
		return mapper.getStoreSmallrate(getCategory_id);
	}
	//소분류 가격 낮은거 부터 조회(별점 리뷰 포함)
	@Override
	public List<BoardVO> getSmallPriceRowrate(int category_id) {
		log.info("getSmallPriceRowrate()...");
		return mapper.getSmallPriceRowrate(category_id);
	}
	//소분류 가격 높은거 부터 조회(별점 리뷰 포함)
	@Override
	public List<BoardVO> getSmallPriceHightrate(int category_id) {
		log.info("getSmallPriceHightrate()...");
		return mapper.getSmallPriceHightrate(category_id);
	}
	//소분류 별점순(별점 리뷰 포함)
	@Override
	public List<BoardVO> getSmallhighStar(int category_id) {
		log.info("getSmallhighStar()...");
		return mapper.getSmallhighStar(category_id);
	}
	//리뷰 많은순(별점 리뷰 포함)
	@Override
	public List<BoardVO> gethighReview() {
		log.info("gethighReview()...");
		return mapper.gethighReview();
	}
	//소분류 리뷰 많은순(별점 리뷰 포함)
	@Override
	public List<BoardVO> getSmallhighReview(int category_id) {
		log.info("getSmallhighReview()...");
		return mapper.getSmallhighReview(category_id);
	}

	


	

}
