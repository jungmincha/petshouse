package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.HomeMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class HomeServiceImpl implements HomeService {

	
	public HomeMapper mapper;
	

	//상품 더보기, 검색
	@Override
	public List<BoardVO> getMoreGoods(String keyword, Criteria cri) {
		log.info("getMoreGoods");
		return mapper.getMoreGoods(keyword,cri);
	}
	//질답 더보기, 검색
	@Override
	public List<BoardVO> getMoreQna(String keyword, Criteria cri) {
		log.info("getMoreQna");
		return mapper.getMoreQna(keyword,cri);
	}
	//노하우 더보기, 검색
	@Override
	public List<ImageVO> getMoreTips(String keyword, Criteria cri) {
		log.info("getMoreTips");
		return mapper.getMoreTips(keyword,cri);
	}
	
	  @Override 
	  public int qcount(String keyword){
		log.info("qcount()");
		return mapper.qcount(keyword); 
	  }
	@Override
	public int tcount(String keyword) {
		log.info("tcount()");
		return mapper.tcount(keyword); 
	}
	@Override
	public int gcount(String keyword) {
		log.info("gcount()");
		return mapper.gcount(keyword); 
	}
	
	@Override
	public List<BoardVO> getStorerate(Criteria cri) {
		log.info("getStorerate/cri");
		cri.setAmount(8);
		return mapper.getStorerate(cri);
	}
	 


}
