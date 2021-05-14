package com.pet.ex.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	public List<ImageVO> getHashtag(BoardVO boardVO );

	public void fileUpload(String imgname);

	public void detailInput(ImageVO imageVO );

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
	//댓글더보기
	public List<BoardVO> getcommentsList(Criteria cri, int board_id);
	//댓글 카운트
	public int qcount(int board_id);
	//현재 장소
	public String getPresetnLocation(String member_id);
	//리스트 객체 수 구하기
	public int getListTotal(BoardVO boardVO);
	//좋아요 board테이블에서 삭제
	public void delete_content_plike(int board_id);
	//글 삭제시 좋아요 삭제
	public void delete_pgroup(int pgroup);
	//카테고리별로 더보기
	public List<ImageVO> getcateList(Criteria cri);

	




}
