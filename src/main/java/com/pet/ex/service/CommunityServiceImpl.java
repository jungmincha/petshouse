package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.CommunityMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	public CommunityMapper mapper;

	// 노하우 메인페이지 리스트 출력
	@Override
	public List<BoardVO> getTipsList(Criteria cri) {
		log.info("mapper.getTipsList()");
		return mapper.getTipsWithPaging(cri);
	}
	
	// 노하우 특정 페이지 가져오기
	@Override
	public BoardVO getTipsview(int board_id) {
		log.info("getTipsview()");
		return mapper.getTipsview(board_id);
	}

	// 노하우 글 작성
	@Override
	public void writeTips(BoardVO boardVO) {
		log.info("mapper.writeTips()호출");
		mapper.writeTips(boardVO);
	}

	// 노하우 글 검색
	@Override
	public List<BoardVO> getTsearch(String keyword) {
		log.info("mapper.getTsearch()");
		return mapper.getTsearch(keyword);
	}
	
	
	// 노하우 페이징 처리용
	@Override
	public int getTiptal(Criteria cri) {
		return mapper.getTiptalCount(cri);
	}

	//노하우 글 수정
	@Override
	public void tmodify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);
	}

	//노하우 글 삭제
	@Override
	public void tdelete(int board_id) {
		log.info("mapper.delete()호출");
		mapper.delete(board_id);
	}

	// 질문과 답변 메인 리스트 출력
	@Override
	public List<BoardVO> getQnaList(Criteria cri) {
		log.info("getQnaList(cri)");
		return mapper.getListWithPaging(cri);
	}

	// 질문과 답변 특정 페이지 가져오기
	@Override
	public BoardVO getQnaview(int board_id) {
		log.info("mapper.getQnaview()");
		return mapper.getQnaview(board_id);
	}
	
	// 질문과 답변 글 검색
	@Override
	public List<BoardVO> getQsearch(String keyword) {
		log.info("mapper.getQsearch()호출");
		return mapper.getQsearch(keyword);
	}

	// 질문과 답변 댓글 가져오기
	@Override
	public List<BoardVO> getComment(int Board_id) {
		log.info("getComment()");
		return mapper.getComment(Board_id);
	}
	
	// 질문과 답변 댓글 작성
	@Override
	public void writeComment(BoardVO boardVO) {
		log.info("mapper.writeComment()호출");
		mapper.writeComment(boardVO);
	}

	// 질문과 답변 조회수
	@Override
	public void hit(int board_id) {
		mapper.hit(board_id);
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


}
