package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.CommunityMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	public CommunityMapper mapper;


	@Override
	public void deleteQnaComment(BoardVO boardVO) {
		
		mapper.deleteComment(boardVO);
	}
	@Override
	public void deleteTipsComment(BoardVO boardVO) {
		
		mapper.deleteComment(boardVO);
	}


	@Override
	public BoardVO getBoardInfo(int board_id) {

		return mapper.getboardInfo(board_id);
	}

	@Override
	public BoardVO getBoard(int board_id) {

		return mapper.getBoard(board_id);
	}

	@Override
	public List<ImageVO> getImg(int board_id) {

		return mapper.getImg(board_id);
	}

	@Override
	public int counta(int board_id) {
		log.info("counta()");
		System.out.println(board_id);
		return mapper.counta(board_id);
	}

	// 노하우 메인페이지 리스트 출력
	@Override
	public List<BoardVO> getTipsList(Criteria cri) {
		log.info("mapper.getTipsList()");
		return mapper.getTipsList(cri);
	}

	// 노하우 글 작성
	@Override
	public void writeTips(BoardVO boardVO) {
		log.info("mapper.writeTips()호출");
		mapper.writeTips(boardVO);
	}
	
	// 노하우 동물에 해당하는 글
	@Override
	public List<BoardVO> getPetTips(int category_id) {
		log.info("mapper.getPetTips()");
		return mapper.getPetTips(category_id);
	}
	
	// 노하우 인기 게시글
	@Override
	public List<BoardVO> getTipsRate() {
		log.info("mapper.getTipsRate()");
		return mapper.getTipsRate();
	}
	

	@Override
	public BoardVO getTipsBoard_id() {
		log.info("getTipsBoard_id");
		return mapper.getTipsBoard_id();
	}


	// 노하우 글 수정
	@Override
	public void tmodify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);
	}

	// 노하우 글 삭제
	@Override
	public void tdelete(int board_id) {
		log.info("mapper.delete()호출");
		mapper.delete(board_id);
	}

	// 노하우 댓글 가져오기
	@Override
	public List<BoardVO> listTComment(int board_id, Criteria cri) {
		log.info("listTComment()");
		return mapper.listTComment(board_id, cri);
	}

	@Override
	public BoardVO getTComment(int board_id) {
		log.info("getTComment()");
		return mapper.getTComment(board_id);
	}

	// 노하우 댓글 작성
	@Override
	public void insertTComment(BoardVO boardVO) {
		log.info("insertTComment");
		mapper.insertTComment(boardVO);

	}

	// 노하우 댓
	@Override
	public List<BoardVO> getTCommentList(Criteria cri, int board_id) {
		return mapper.getTCommentWithPaging(cri, board_id);
	}

	
	
	// 질문과 답변 메인 리스트 출력
	@Override
	public List<BoardVO> getQnaList(Criteria cri) {
		log.info("getQnaList(cri)");
		return mapper.getListWithPaging(cri);
	}


	// 질문과 답변 페이징 처리용 토탈카운트
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal()");
		return mapper.getTotalCount(cri);
	}

	// 질문과 답변 글 진짜로 작성
	@Override
	public void writeQna(BoardVO boardVO) {
		log.info("mapper.writeQna()호출");
		mapper.writeQna(boardVO);
	}

	// 질문과 답변 글 수정하기
	@Override
	public void modify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);
	}

	// 질문과 답변 글 삭제하기
	@Override
	public void delete(int board_id) {
		log.info("mapper.delete()호출");
		mapper.delete(board_id);
	}
	
	@Override
	public BoardVO getQnaInfo(int board_id) {

		return mapper.getQnaInfo(board_id);
	}

	@Override
	public BoardVO getQnaBoard(int board_id) {

		return mapper.getQnaBoard(board_id);
	}

	@Override
	public int qcount(int board_id) {
		log.info("qcount()");
		System.out.println(board_id);
		return mapper.qcount(board_id);
	}

	// 질문과 답변 동물에 해당하는 글
	@Override
	public List<BoardVO> getPetQna(int category_id) {
		log.info("mapper.getPetQna()");
		return mapper.getPetQna(category_id);
	}

	// 질문과 답변 태그
	@Override
	public List<BoardVO> getQtag(String keyword) {
		log.info("mapper.getQtag()호출");
		return mapper.getQtag(keyword);
	}

	// 질문과 답변 글 검색
	@Override
	public List<BoardVO> getQsearch(String keyword) {
		log.info("mapper.getQsearch()호출");
		return mapper.getQsearch(keyword);
	}

	@Override
	public BoardVO getQnaBoard_id() {
		log.info("getQnaBoard_id");
		return mapper.getQnaBoard_id();
	}

	// 질문과 답변 댓글 가져오기
	@Override
	public List<BoardVO> listComment(int Board_id, Criteria cri) {
		log.info("listComment()");
		return mapper.listComment(Board_id, cri);
	}

	@Override
	public BoardVO getComment(int Board_id) {
		log.info("getComment()");
		return mapper.getComment(Board_id);
	}

	// 질문과 답변 댓글 작성
	@Override
	public void insertComment(BoardVO boardVO) {
		log.info("");
		mapper.insertComment(boardVO);

	}

	@Override
	public List<BoardVO> getcommentsList(Criteria cri, int board_id) {
		return mapper.getCommentsWithPaging(cri, board_id);
	}
	
	
	
	@Override
	public void ImgInput(ImageVO imageVO) {
		log.info("ImgInput");
		mapper.ImgInput(imageVO);
	}
	
	// 조회수
	@Override
	public void hit(int board_id) {
		mapper.hit(board_id);
	}


	 

	@Override
	public void ImgDelete(int board_id) {
		mapper.ImgDelete(board_id);
		
	}
 
	/*
	 * // 노하우 댓글 작성
	 * 
	 * @Override public void writeTComment(BoardVO boardVO) {
	 * log.info("mapper.writeTComment()호출"); mapper.writeTComment(boardVO); } // 질문과
	 * 답변 댓글 작성
	 * 
	 * @Override public void writeComment(BoardVO boardVO) {
	 * log.info("mapper.writeComment()호출"); mapper.writeComment(boardVO); }
	 * 
	 * // 노하우 특정 페이지 가져오기
	 * 
	 * @Override public BoardVO getTipsview(int board_id) {
	 * log.info("getTipsview()"); return mapper.getTipsview(board_id); }
	 * 
	 * // 질문과 답변 특정 페이지 가져오기
	 * 
	 * @Override public BoardVO getQnaview(int board_id) {
	 * log.info("mapper.getQnaview()"); return mapper.getQnaview(board_id); } // 노하우
	 * 글 검색
	 * 
	 * @Override public List<BoardVO> getTsearch(String keyword) {
	 * log.info("mapper.getTsearch()"); return mapper.getTsearch(keyword); }
	 * 
	 */
}
