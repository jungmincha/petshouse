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

	public void insertComment(BoardVO boardVO);

	public BoardVO getComment(int board_id);

	public List<BoardVO> listComment(int board_id);

	public void hit(int board_id);

	public int counta(int board_id);

	public List<ImageVO> getsnsList();



}
