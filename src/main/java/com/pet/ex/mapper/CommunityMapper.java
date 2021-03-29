package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;


@Mapper
public interface CommunityMapper {

	//질문과 답변 메인 페이지 
	public List<BoardVO> getQnaList();
	
	//질문과 답변 특정 글 페이지
	public BoardVO getQnaview(int board_id);
	
	//조회수 어쩔거임
	//public void hit(int board_id);
	
	// 페이징 처리 리스트 출력
	public List<BoardVO> getListWithPaging(Criteria cri);

	// 페이징 처리용 토탈카운트,,,,
	public int getTotalCount(Criteria cri);

	//진짜 글쓰기
	//public void writeQnt(BoardVO boardVO);
	
}
