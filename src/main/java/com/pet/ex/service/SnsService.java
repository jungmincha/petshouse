package com.pet.ex.service;



import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;

import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

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

	public List<BoardVO> listComment(int Board_id, Criteria cri);

	//조회수
	public void hit(int board_id);
    //댓글수
	public int counta(int board_id);

	 
	public List<ImageVO> getsnsList(Criteria cri);

	public int getSnstotal(Criteria cri);

	public MemberVO getMemberInfo(String member_id);
	
	//페이징
	public List<BoardVO> getcommentsList(Criteria cri,int board_id);
 
	public void deleteComment(BoardVO boardVO);

	public void modifySns(BoardVO boardVO);

	public void deleteSns(int board_id);

	/* public List<ImageVO> getUserboard(String nickname); */
 

}
