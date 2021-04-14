package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.SnsMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class SnsServiceImpl implements SnsService {

	public SnsMapper mapper;

	@Override
	public void snsBoardInput(BoardVO boardVO) {
		log.info("snsBoardInput");
		mapper.snsBoardInput(boardVO);
	}

	@Override
	public BoardVO getSnsBoard_id() {
		log.info("getSnsBoard_id");
		return mapper.getSnsBoard_id();
	}

	@Override
	public void snsImgInput(ImageVO imageVO) {
		log.info("snsImgInput");
		mapper.snsImgInput(imageVO);
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
	public void insertComment(BoardVO boardVO) {
		log.info("insertComment");
		mapper.insertComment(boardVO);

	}

	@Override
	public BoardVO getComment(int Board_id) {
		log.info("getComment()");
		return mapper.getComment(Board_id);
	}

	@Override
	public List<BoardVO> listComment(int Board_id) {
		log.info("listComment()");
		return mapper.listComment(Board_id);
	}

	@Override
	public void hit(int board_id) {

		mapper.hit(board_id);
	}

	@Override
	public int counta(int board_id) {
		log.info("counta()");
		System.out.println(board_id);
		return mapper.counta(board_id);
	}

	@Override
	public List<ImageVO> getsnsList(Criteria cri) {
		log.info("getsnsList()");
		cri.setAmount(8);
		return mapper.getsnsList(cri);
	}
	
	@Override
	public int getSnstotal(Criteria cri) {
		return mapper.getSnstotal(cri);
	}

	@Override
	public MemberVO getMemberInfo(String member_id) {
	 
		return mapper.getMemberInfo(member_id);
	}

}
