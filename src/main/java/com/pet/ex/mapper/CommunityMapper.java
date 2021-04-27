package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.PlikeVO;

@Mapper
public interface CommunityMapper {
	
	
	// 댓글 삭제
	public void deleteComment(BoardVO boardVO);
	//이미지
	public List<ImageVO> getImg(int board_id);
	// 조회수
	public void hit(int board_id);
	// 이미지 삽입
	public void ImgInput(ImageVO imageVO);
	//이미지 삭제
	public void ImgDelete(int board_id);
	
	//노하우 총 개수
	public List<ImageVO> getTipsCount();
	// 노하우 특정글
	public BoardVO getboardInfo(int board_id);
	//노하우
	public BoardVO getBoard(int board_id);

	// 노하우 페이징 처리 리스트 출력
	public List<ImageVO> getTipsList(Criteria cri);
	// 노하우 진짜 글쓰기
	public void writeTips(BoardVO boardVO);
	// 노하우 해당 동물의 글
	public List<ImageVO> getPetTips(int category_id);
	// 노하우 인기 게시글
	public List<ImageVO> getTipsRate();
	// 노하우 글 수정하기
	public void tmodify(BoardVO boardVO);
	// 노하우 사진 때문에
	public BoardVO getTipsBoard_id();
	
	// 노하우 댓글 카운트
	public int tcount(int board_id);
	// 노하우 댓글 작성
	public void insertTipsComment(BoardVO boardVO);
	// 노하우 작성 후 ajax로 삽입
	public BoardVO getTipsComment(int board_id);
	// 더보기
	public List<BoardVO> getTipsCommentList(int board_id,Criteria cri);

	// 질문과 답변 특정글
	public BoardVO getQnaInfo(int board_id);
	public BoardVO getQnaBoard(int board_id);

	// 질문과 답변 글 검색
	public List<BoardVO> getQnasearch(String keyword);
	// 질문과 답변 진짜 글쓰기
	public void writeQna(BoardVO boardVO);
	// 질문과 답변 메인페이지 출력
	public List<BoardVO> getQnaList(Criteria cri);
	// 페이징 처리용 토탈카운트,,,,
	public int getTotalCount(Criteria cri);
	// 질문과 답변 글 수정하기
	public void modify(BoardVO boardVO);
	// 질문과 답변 글 삭제하기
	public void delete(int board_id);
	// 질문과 답변 해당 동물의 글
	public List<BoardVO> getPetQna(int category_id);
	// 질문과 답변 태그
	public List<BoardVO> getQnatag(String keyword);
	// 질문과 답변 사진 때문에
	public BoardVO getQnaBoard_id();
	//검색카운드
	public int qscount(String keyword);
	
	// 댓글 카운트
	public int qcount(int board_id);
	// 질문과 답변 댓글 작성
	public void insertComment(BoardVO boardVO);
	public List<BoardVO> countComment(BoardVO boardVO);	
	// 질문과 답변 댓글 출력(ajax)
	public BoardVO getComment(int board_id);
	// 질문과 답변 댓글 페이징
	public List<BoardVO> getcommentsList(Criteria cri, int board_id);


	//좋아요
	public String getPresetnNickname(String member_id);
	public String getNickname(int board_id);
	public List<ImageVO> getUserboard(String nickname);
	public int getLiketotal(int board_id);
	public int isLike(PlikeVO plikeVO);
	public List<PlikeVO> getLikelist(PlikeVO plikeVO);
	public void like(PlikeVO plikeVO);
	public void likecancel(PlikeVO plikeVO);
	public void insertplike(BoardVO boardVO);
	public void deleteplike(BoardVO boardVO);


}
