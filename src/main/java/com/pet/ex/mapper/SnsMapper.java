package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;

import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

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
 
	public List<ImageVO> getsnsList(Criteria cri);

 

	public MemberVO getMemberInfo(String member_id);
	
	public List<BoardVO> getCommentsWithPaging(Criteria cri, int board_id);

	public void deleteComment(BoardVO boardVO);

	public void modifySns(BoardVO boardVO);

	public void deleteImg(int board_id);

	public void deleteBoard(int board_id);

	
	public List<ImageVO> getUserboard(String nickname);
	 
	public String getNickname(int board_id);
	
	//좋아요 수 
	public int getLiketotal(int board_id);
	//좋아요 유무 체크
	public int isLike(PlikeVO plikeVO);
	//좋아요 리스트 
	public List<PlikeVO> getLikelist(PlikeVO plikeVO);
	//좋아요 요청
	public void like(PlikeVO plikeVO);
	//board테이블의 plike 숫자 증가
	public void insertplike(BoardVO boardVO);
	//좋아요 취소
	public void likecancel(PlikeVO plikeVO);
	//board테이블의 plike 숫자 감소
	public void deleteplike(BoardVO boardVO);
	//현재 닉네임 
	public String getPresetnNickname(String member_id);

	public List<BoardVO> getSnstag(String keyword);

	public List<ImageVO> getsnsmoreList(Criteria cri);

	public List<ImageVO> getSnsCategory(ImageVO imageVO, Criteria cri);

	
	public List<BoardVO> getCommentsList(int board_id, Criteria cri);

	public int getCommentsCount(int board_id);

	//sns 총 갯수
	public  int getSnstotal(BoardVO boardVO);
	public List<ImageVO> imgCount(ImageVO imageVO);
	public List<BoardVO> countComment(BoardVO boardVO);

	public List<BoardVO> getSnsCatetotal(ImageVO imageVO);

}
