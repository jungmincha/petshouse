package com.pet.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.StoreMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.PointVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

	@Autowired
	public StoreMapper mapper;

	@Override
	public List<BoardVO> getStorerate(Criteria cri) {
		log.info("getStorerate/cri");
		cri.setAmount(8);
		return mapper.getStorerate(cri);
	}

	@Override
	public List<BoardVO> getGoodsinfo() {
		log.info("getGoodsinfo");
		return mapper.getGoodsinfo();
	}
	
	@Override
	public List<BoardVO> getBestrate(int category_id) {
		log.info("getBestrate");
		return mapper.getBestrate(category_id);
	}

	@Override
	public List<CategoryVO> getCategory() {
		log.info("getCategory");
		return mapper.getCategory();
	}
	
	@Override
	public void point(PointVO pointVO) {
		log.info("point");
		mapper.point(pointVO);
	}
	
	@Override
	public int getEventstatus(PointVO pointVO) {
		log.info("getEventstatus");
		return mapper.getEventstatus(pointVO);	
	}

	//커뮤니티 노하우 조회
	@Override
	public List<BoardVO> getKnowhow() {
		log.info("getKnowhow");
		return mapper.getKnowhow();
	}

	//커뮤니티 SNS 조회
	@Override
	public List<BoardVO> getSns() {
		log.info("getSns");
		return mapper.getSns();
	}
}
