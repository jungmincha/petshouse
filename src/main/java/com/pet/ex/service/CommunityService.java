package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;



public interface CommunityService {

	//질문과 답변 페이지 
	public List<BoardVO> getQnaList();
	
	//질문과 답변 특정 글 페이지
	public BoardVO getQnaview(int board_id);
	
	//조회수 어쩔거임
	//public void hit(int board_id);
	
	// 작성된 리뷰
	public List<BoardVO> getQnaList(Criteria cri);
		
	// 페이징 처리 리스트 출력
	public int getTotal(Criteria criteria);

	//post로 글 쓰는거 맞니.. 로그인 때메 그런가 물어보기
	public void writeQnt(BoardVO boardVO);
	
	public void modify(BoardVO boardVO);

	public void delete(int bId);
		
}
