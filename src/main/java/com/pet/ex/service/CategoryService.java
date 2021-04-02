package com.pet.ex.service;

import java.util.List;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;



public interface CategoryService {

	/* public List <GoodsVO>getGoods(); */

	public List <BoardVO>getboard();//3번(상품) 게시판
	
	public List<CategoryVO> getCategory();

	

	public List<GoodsVO> getbigcategory(int getCategory_id);



	public List<CategoryVO> getScategory(CategoryVO categoryvo);



	/* public List <GoodsVO> getSmallGoods(); */

	public List<CategoryVO> getSmallGoods(int getCategory_id);

	public List <BoardVO> gethighprice();

	public List <BoardVO> getrowprice();

	public List <BoardVO> getshighprice(int category_id);



	public List <BoardVO> getStorerate();

	public List <BoardVO> gethighStar();






	/* public List<BoardVO> getStorerate(); */










	



	

}
