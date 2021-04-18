package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.HomeMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class HomeServiceImpl implements HomeService {

	
	public HomeMapper mapper;
	

	//상품 검색
	@Override
	public List<GoodsVO> getGsearch(String keyword) {
		log.info("mapper.getGsearch()호출");
		return mapper.getGsearch(keyword);
	}
	
	// 질문과 답변 글 검색
	@Override
	public List<BoardVO> getQsearch(String keyword) {
		log.info("mapper.getQsearch()호출");
		return mapper.getQsearch(keyword);
	}
	
	// 노하우 글 검색
	@Override
	public List<BoardVO> getTsearch(String keyword) {
		log.info("mapper.getTsearch()");
		return mapper.getTsearch(keyword);
	}
	

}
