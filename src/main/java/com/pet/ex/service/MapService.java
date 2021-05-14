package com.pet.ex.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pet.ex.page.Criteria;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;



public interface MapService {

	//위치기반 홈 리스트
	public List<ImageVO> getList(Criteria cri);
	//게시판 전체 숫자
	public int getTotal(Criteria cri);
	//글작성
	public void write(BoardVO boardVO);
	//글내용
	public BoardVO content_view(int board_id);
	//글삭제(board_id)
	public void inputDelete(int board_id);
	//펫츠타운 현재 위치 인증
	public void insertLoc(MemberVO memberVO);

	public List<MemberVO> getMemberList(String getMember_id);

	public List<BoardVO> getSerchList(Criteria cri);
	//댓글리스트
	public List<BoardVO> listComment(int board_id);
	//댓글작성
	public void insertComment(BoardVO boardVO);

	public BoardVO getComment(int Board_id);
	//해시태그별로 게시판 뿌리기
	public List<ImageVO> getHashtag(BoardVO boardVO );
	//파일업로드
	public void fileUpload(String imgname);
	//이미지 업로드
	public void detailInput(ImageVO imageVO , MultipartHttpServletRequest multi)throws Exception;
	//글 수정
	public void modify(BoardVO boardVO);
	//댓글 삭제
	public void deleteComment(BoardVO boardVO);
	//조회수
	public void hit(int board_id);

	
	
	//다중이미지 (list)처리
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
	//현재 정보를 가져오는 서비스
	public BoardVO getLocationBoard_id();
	//이미지 삭제
	public void depeteimage(int board_id);
	//이미지 출력
	public List<ImageVO> getPhoto(int board_id);
	//좋아요 리스트
	public List<PlikeVO> getAllLikelist(PlikeVO plikeVO);
	//댓글더보기
	public List<BoardVO> getcommentsList(Criteria cri, int board_id);
	//댓글 수 카운트
	public int qcount(int board_id);
	//현재 장소
	public String getPresetnLocation(String member_id);

	public int getListTotal(BoardVO boardVO);
	//컨텐트뷰 좋아요 삭제
	public void delete_content_plike(int board_id);
	//글 삭제시 좋아요 삭제
	public void delete_pgroup(int pgroup);
	//카테고리별로 더보기
	public List<ImageVO> getcateList(Criteria cri);
	

	

	
	

	//public List<ImageVO> getImgList();

	
}
