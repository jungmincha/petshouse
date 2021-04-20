package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;

public interface CommunityService {

	public List<ImageVO> getImg(int board_id);

	// 조회수
	public void hit(int board_id);

	public void ImgInput(ImageVO imageVO);

	// 질문과 답변 메인 페이지 리스트
	public List<BoardVO> getQnaList(Criteria cri);

	// 질문과 답변 특정글
	public BoardVO getQnaInfo(int board_id);

	public BoardVO getQnaBoard(int board_id);

	// 댓글 카운트
	public int qcount(int board_id);

	// 질문과 답변 검색 리스트 출력
	public List<BoardVO> getQsearch(String keyword);

	// qna 사진 때문에
	public BoardVO getQnaBoard_id();

	// 질문과 답변 글 작성하기
	public void writeQna(BoardVO boardVO);

	// 질문과 답변 페이징 처리 출력
	public int getTotal(Criteria criteria);

	// 질문과 답변 글 수정하기
	public void modify(BoardVO boardVO);

	// 질문과 답변 글 삭제하기
	public void delete(int bId);

	// 질문과 답변 동물에 해당하는 글
	public List<BoardVO> getPetQna(int category_id);

	// 질문과 답변 태그
	public List<BoardVO> getQtag(String keyword);

	// 질문과 답변 댓글
	public List<BoardVO> listComment(int board_id, Criteria cri);

	// 댓글 작성 후 ajax로 삽입
	public BoardVO getComment(int Board_id);

	// 댓글 작성
	public void insertComment(BoardVO boardVO);

	// 페이징
	public List<BoardVO> getcommentsList(Criteria cri, int board_id);

	// 노하우 메인 페이지
	public List<ImageVO> getTipsList(Criteria cri);

	// 댓글수
	public int counta(int board_id);

	// 노하우 글 작성하기
	public void writeTips(BoardVO boardVO);

	// 노하우 글 수정하기
	public void tmodify(BoardVO boardVO);

	// 노하우 글 삭제하기
	public void tdelete(int board_id);

	// 노하우 조회
	public BoardVO getBoardInfo(int board_id);

	public BoardVO getBoard(int board_id);

	// 노하우
	public List<ImageVO> getPetTips(int category_id);

	// 노하우 상단 인기 게시글
	public List<ImageVO> getTipsRate();

	public BoardVO getTipsBoard_id();

	// 노하우 댓글 리스트
	public List<BoardVO> listTComment(int board_id, Criteria cri);

	// 댓글 작성 후 ajax로 삽입
	public BoardVO getTComment(int board_id);

	public void insertTComment(BoardVO boardVO);

	public List<BoardVO> getTCommentList(int board_id, Criteria cri);

	public void deleteQnaComment(BoardVO boardVO);

	public void deleteTipsComment(BoardVO boardVO);

	public void ImgDelete(int board_id);

	// 노하우 댓글 작성하기
	// public void writeTComment(BoardVO boardVO);
	// 질문과 답변 댓글 작성하기
	// public void writeComment(BoardVO boardVO);
	// 노하우 특정 글 페이지
	// public Object getTipsview(int board_id);
	// 질문과 답변 특정 글 페이지
	// public BoardVO getQnaview(int board_id);
	// 노하우 검색 리스트 출력
	// public List<BoardVO> getTsearch(String keyword);
}
