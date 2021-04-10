package com.pet.ex.service;

 
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
	public void snsInput(BoardVO boardVO,ImageVO imageVO) {
		 
		mapper.snsInput(boardVO);
		mapper.imgInput(imageVO);
	}

	/*
	 * @Override public void imgInput(ImageVO imageVO) {
	 * 
	 * 
	 * }
	 */

	 
	

}
