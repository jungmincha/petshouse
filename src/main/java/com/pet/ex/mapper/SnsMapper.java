package com.pet.ex.mapper;

 


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
 
import com.pet.ex.vo.ImageVO;
 

@Mapper
public interface SnsMapper {
	
	 

	public void snsBoardInput(BoardVO boardVO);

	public BoardVO getSnsBoard_id();
	
	public void snsImgInput(ImageVO imageVO);

	public BoardVO getboardInfo(int board_id);

	public BoardVO getBoard(int board_id);

	public List<ImageVO> getImg(int board_id);


 


	




	

	



}
