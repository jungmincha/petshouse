package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.CommunityMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	public CommunityMapper mapper;

	// 질문과 답변 메인페이지 가져오기
	@Override
	public List<BoardVO> getQnaList() {
		log.info("getQnaList");
		return mapper.getQnaList();

	}

	// 노하우 메인페이지 가져오기
	@Override
	public List<BoardVO> getTipsList() {
		log.info("getTipsList");
		return mapper.getTipsList();

	}

	// 질문과 답변 특정 페이지 가져오기
	@Override
	public BoardVO getQnaview(int board_id) {
		// TODO Auto-generated method stub
		return mapper.getQnaview(board_id);
	}

	// 질문과 답변 특정 페이지 가져오기
	@Override
	public BoardVO getTipsview(int board_id) {
		log.info("getTipsview");
		return mapper.getTipsview(board_id);
	}
	
	// 질문과 답변 특정 페이지 가져오기
	@Override
	public List<BoardVO> getComment(int Board_id) {
		// TODO Auto-generated method stub
		return mapper.getComment(Board_id);
	}

	// 조회수 어쩔거임
	// @Override
	// public void hit(int board_id) {
	// mapper.hit(board_id);
	//
	// }

	// 페이징 처리용 토탈카운트
	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotalCount(cri);
	}

	// 페이징 처리 리스트 출력
	@Override
	public List<BoardVO> getQnaList(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}
	
	//노하우 페이징 처리
	@Override
	public List<BoardVO> getTipsList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}


	// 글 진짜로 작성
	@Override
	public void writeQna(BoardVO boardVO) {
		log.info("mapper.writeQna()호출");
		mapper.writeQna(boardVO);

	}

	// 글 수정하기
	@Override
	public void modify(BoardVO boardVO) {
		log.info("mapper.modify()호출");
		mapper.modify(boardVO);

	}

	// 글 삭제하기
	@Override
	public void delete(int board_id) {
		log.info("mapper.delete()호출");
		mapper.delete(board_id);

	}

	// 글 검색
	@Override
	public List<BoardVO> getQsearch(String keyword) {
		log.info("mapper.getQsearch()호출");
		return mapper.getQsearch(keyword);
	}


}
