package com.pet.ex.service;



import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;

import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

public interface SnsService {

	
	//SNS 게시글 등록
	public void snsBoardInput(BoardVO boardVO);
	
	//SNS 이미지 등록
	public BoardVO  getSnsBoard_id();
	
	public void snsImgInput(ImageVO imageVO);
	
	//SNS 조회
	public BoardVO getBoardInfo(int board_id);
	
	public BoardVO getBoard(int board_id);
	
	public List<ImageVO> getImg(int board_id);
	
	public void hit(int board_id);
	
	public List<BoardVO> getCommentsList(int board_id, Criteria cri);
	
	public MemberVO getMemberInfo(String member_id);
	
	//회원이 쓴 최신 게시글 리스트
	public String getNickname(int board_id);
	
	public List<ImageVO> getUserboard(String nickname); 
	
	//SNS 수정
	public void modifySns(BoardVO boardVO);
	
	//SNS 삭제
	public void deleteSns(int board_id);
	
	//댓글등록
	public void insertComment(BoardVO boardVO);
	
	//댓글등록-AJAX
	public BoardVO getComment(int Board_id);
	
	//댓글조회
	public List<BoardVO> listComment(int Board_id, Criteria cri);
	
	//댓글 페이징
	public List<BoardVO> getcommentsList(Criteria cri,int board_id);
	
	//댓글 삭제
	public void deleteComment(BoardVO boardVO);
	
	//SNS 리스트
	public List<ImageVO> getsnsList(Criteria cri);
	
	//카테고리별 SNS 조회
	public List<ImageVO> getSnsCategory(ImageVO imageVO, Criteria cri);
	
	//카테고리별 SNS 총 개수
	public List<BoardVO> getSnsCatetotal(ImageVO imageVO);
	
	
	//좋아요 수 
	public int getLiketotal(int board_id);
	
	//좋아요 유무 체크
	public int isLike(PlikeVO plikeVO);
	
	//좋아요 리스트 
	public List<PlikeVO> getLikelist(PlikeVO plikeVO);
	
	//좋아요 
	public void like(PlikeVO plikeVO);
	
	//좋아요 취소
	public void likecancel(PlikeVO plikeVO);
	
	//좋아요 증가
	public void insertplike(BoardVO boardVO);
	
	//좋아요 감소
	public void deleteplike(BoardVO boardVO);

	//현재 닉네임 얻는 로직
	public String getPresetnNickname(String member_id);
	//SNS 해시태그
	public List<BoardVO> getSnstag(String keyword);
	//SNS 더보기
	public List<ImageVO> getsnsmoreList(Criteria cri);
	
	//SNS 총 갯수
	public  int getSnstotal(BoardVO boardVO);
	//SNS 댓글수
	public List<BoardVO> countComment(BoardVO boardVO);
	//게시물별 이미지갯수
	public List<ImageVO> imgCount(ImageVO imageVO);
	//SNS 댓글수
	public int getCommentsCount(int board_id);
		

	 


 

}
