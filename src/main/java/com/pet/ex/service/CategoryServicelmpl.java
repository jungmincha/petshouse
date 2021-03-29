package com.pet.ex.service;

import java.util.List; 

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.CategoryMapper;
import com.pet.ex.mapper.StoreMapper;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class CategoryServicelmpl implements CategoryService {

	CategoryMapper mapper;
	
	@Override
	public List<GoodsVO> getGoods() {
		
		return mapper.getGoods();
	}

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
		
		/*int[]arrys = new int[5];
		for(int i = 0 ; i <= arrys.length ; i++) {*/
		
			categoryVO.setCode(2);
	

		
		 
		
		
		return mapper.getScategory(categoryVO);
	}

	
	
	
	

	

}
