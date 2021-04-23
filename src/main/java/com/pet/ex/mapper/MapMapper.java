package com.pet.ex.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

@Mapper
public interface MapMapper {

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

	public BoardVO getComment(int board_id);

	public List<ImageVO> getHashtag(BoardVO boardVO);

	public void fileUpload(String imgname);

	public void detailInput(ImageVO imageVO);

	public void modify(BoardVO boardVO);

	public void deleteComment(BoardVO boardVO);

	public void hit(int board_id);

	public void insertplike(BoardVO boardVO);

	public void deleteplike(BoardVO boardVO);

	
	

	public List<ImageVO> imageupload(ImageVO imageVO);
	
	//좋야요 수
	public int getLiketotal(int board_id);
	//좋아요 유무
	public int isLike(PlikeVO plikeVO);
	//좋아요 리스트
	public List<PlikeVO> getLikelist(PlikeVO plikeVO);
	//좋아요
	public void like(PlikeVO plikeVO);
	//회원정보 조회
	public MemberVO getMemberinfo();
	//좋아요 취소
	public void likecancel(PlikeVO plikeVO);

	public List<PlikeVO> getLikeprint();
	//현재 닉네임 출력
	public String getPresetnNickname(String member_id);

	public BoardVO getLocationBoard_id();
	//사진 삭제
	public void depeteimage(int board_id);
	//content_view 사진 출력
	public List<ImageVO> getPhoto(int board_id);

	public List<PlikeVO> getAllLikelist(PlikeVO plikeVO);



}
