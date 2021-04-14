package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;

@Mapper
public interface CommunityMapper {

	// 노하우 특정 글 페이지
	public BoardVO getTipsview(int board_id);

	// 노하우 글 검색
	public List<BoardVO> getTsearch(String keyword);

	// 노하우 진짜 글쓰기
	public void writeTips(BoardVO boardVO);

	// 노하우 페이징 처리 리스트 출력
	public List<BoardVO> getTipsWithPaging(Criteria cri);

	// 노하우 페이징 처리용 토탈카운트,,,,
	public int getTiptalCount(Criteria cri);
	
	//노하우 해당 동물의 글
	public List<BoardVO> getPetTips(int category_id);

	//노하우 인기 게시글
	public List<BoardVO> getTipsRate();

	// 노하우 글 수정하기
	public void tmodify(BoardVO boardVO);

	// 노하우 글 삭제하기
	public void tdelete(int board_id);
	

	// 질문과 답변 특정 글 페이지
	public BoardVO getQnaview(int board_id);

	// 질문과 답변 진짜 글쓰기
	public void writeQna(BoardVO boardVO);

	// 질문과 답변 글 검색
	public List<BoardVO> getQsearch(String keyword);

	// 조회수 어쩔거임
	public void hit(int board_id);

	// 질문과 답변 메인페이지 출력
	public List<BoardVO> getListWithPaging(Criteria cri);

	// 페이징 처리용 토탈카운트,,,,
	public int getTotalCount(Criteria cri);

	// 질문과 답변 글 수정하기
	public void modify(BoardVO boardVO);

	// 질문과 답변 글 삭제하기
	public void delete(int board_id);

	// 질문과 답변 해당 동물의  글
	public List<BoardVO> getPetQna(int category_id);

	// 질문과 답변 태그
	public List<BoardVO> getQtag(String keyword);
	
	public BoardVO getQnaBoard_id();

	public void QnaImgInput(ImageVO imageVO);
	
	
	// 질문과 답변 댓글쓰기
	public void writeComment(BoardVO boardVO);
	
	// 질문과 답변 댓글 작성
	public void insertComment(BoardVO boardVO);

	// 질문과 답변 댓글 리스트 출력
	public List<BoardVO> listComment(int board_id, Criteria cri);

	// 질문과 답변 댓글 출력(ajax)
	public BoardVO getComment(int board_id);

	public List<BoardVO> getCommentsWithPaging(Criteria cri, int board_id);
	
	//페이징용..
	//public List<BoardVO> getcommentsList(Criteria cri, int board_id);

	
	
	

	// 노하우 댓글 작성하기
	public void writeTComment(BoardVO boardVO);
	// 노하우 댓글 작성
	public void insertTComment(BoardVO boardVO);
	
	// 노하우 댓글 리스트 출력
	public List<BoardVO> listTComment(int board_id, Criteria cri);
	
	// 노하우 작성 후 ajax로 삽입
	public BoardVO getTComment(int board_id);

	public List<BoardVO> getTCommentWithPaging(Criteria cri, int board_id);
	
	public List<BoardVO> getTCommentList(Criteria cri,int board_id);

}


