package com.pet.ex.service;



import java.util.List;

import com.pet.ex.vo.BoardVO;

import com.pet.ex.vo.ImageVO;

public interface SnsService {

	public void snsBoardInput(BoardVO boardVO);

	public BoardVO  getSnsBoard_id();

	public void snsImgInput(ImageVO imageVO);

	public BoardVO getBoardInfo(int board_id);

	public BoardVO getBoard(int board_id);

	public List<ImageVO> getImg(int board_id);

}
