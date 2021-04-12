package com.pet.ex.service;



import java.util.List;

import com.pet.ex.vo.BoardVO;

import com.pet.ex.vo.ImageVO;

public interface SnsService {

	
	//sns 등록
	public void snsBoardInput(BoardVO boardVO);

	public BoardVO  getSnsBoard_id();

	public void snsImgInput(ImageVO imageVO);

	//sns 조회
	public BoardVO getBoardInfo(int board_id);

	public BoardVO getBoard(int board_id);

	public List<ImageVO> getImg(int board_id);

	//댓글
	public void insertComment(BoardVO boardVO);

	public BoardVO getComment(int Board_id);

	public List<BoardVO> listComment(int Board_id);

	//조회수
	public void hit(int board_id);
  
 

	public int counta(int board_id);
 

}
