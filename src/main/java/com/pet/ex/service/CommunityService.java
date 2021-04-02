package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;

public interface CommunityService {

	// 질문과 답변 메인 페이지
	public List<BoardVO> getQnaList();
	
	// 노하우 메인 페이지
	public List<BoardVO> getTipsList();
	
	// 노하우 메인 페이지
	public List<BoardVO> getTipsList(Criteria cri);

	// 질문과 답변 특정 글 페이지
	public BoardVO getQnaview(int board_id);
	
	// 노하우 특정 글 페이지
	public Object getTipsview(int board_id);

	//댓글 출력
	public List<BoardVO> getComment(int Board_id);
		
	// 조회수 어쩔거임
	// public void hit(int board_id);

	// 페이징 처리용 질문과 답변 페이지
	public List<BoardVO> getQnaList(Criteria cri);

	// 페이징 처리 리스트 출력
	public int getTotal(Criteria criteria);

	// 글 작성하기
	public void writeQna(BoardVO boardVO);

	// 글 수정하기
	public void modify(BoardVO boardVO);

	//글 삭제하기
	public void delete(int bId);

	//검색 리스트 출력
	public List<BoardVO> getQsearch(String keyword);


}
