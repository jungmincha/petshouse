package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;

import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

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

	public List<BoardVO> listComment(int board_id, Criteria cri);

	public void hit(int board_id);

	public int counta(int board_id);

	public List<ImageVO> getsnsList(Criteria cri);

	public int getSnstotal(Criteria cri);

	public MemberVO getMemberInfo(String member_id);
	
	public List<BoardVO> getCommentsWithPaging(Criteria cri, int board_id);



}
