package com.pet.ex.service;

 

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.SnsMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;

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

  

}
