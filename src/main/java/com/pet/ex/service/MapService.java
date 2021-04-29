package com.pet.ex.service;

import java.util.List;
import java.util.Map;

import com.pet.ex.page.Criteria;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;



public interface MapService {

	//위치기반 홈 리스트
	public List<ImageVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	public void write(BoardVO boardVO);

	public BoardVO content_view(int board_id);

	public void inputDelete(int board_id);

	public void insertLoc(MemberVO memberVO);

	public List<MemberVO> getMemberList(String getMember_id);

	public List<BoardVO> getSerchList(Criteria cri);

	public List<BoardVO> listComment(int board_id);

	public void insertComment(BoardVO boardVO);

	public BoardVO getComment(int Board_id);

	public List<ImageVO> getHashtag(BoardVO boardVO);

	public void fileUpload(String imgname);

	public void detailInput(ImageVO imageVO);

	public void modify(BoardVO boardVO);

	public void deleteComment(BoardVO boardVO);
	
	public void hit(int board_id);

	
	

	public List<ImageVO> imageupload(ImageVO imageVO);
	
	
	//좋아요 수 조회
	public int getLiketotal(int board_id);
	//좋아요 유무 체크
	public int isLike(PlikeVO plikeVO);
	//좋아요 리스트
	public List<PlikeVO> getLikelist(PlikeVO plikeVO);
	//좋아요
	public void like(PlikeVO plikeVO);
	//좋아요 취소
	public void likecancel(PlikeVO plikeVO);
	//회원정보 조회
	public MemberVO getMemberinfo();

	public List<PlikeVO> getLikeprint();

	//좋아요 board 테이블에 추가
	public void insertplike(BoardVO boardVO);
	//좋아요 board 테이블에 삭제
	public void deleteplike(BoardVO boardVO);
	//현재 닉네임 가져오는 서비스
	public String getPresetnNickname(String member_id);

	public BoardVO getLocationBoard_id();

	public void depeteimage(int board_id);

	public List<ImageVO> getPhoto(int board_id);

	public List<PlikeVO> getAllLikelist(PlikeVO plikeVO);
	//댓글더보기
	public List<BoardVO> getcommentsList(Criteria cri, int board_id);
	//댓글 수 카운트
	public int qcount(int board_id);
	//현재 장소
	public String getPresetnLocation(String member_id);

	

	
	

	//public List<ImageVO> getImgList();

	
}
