package com.pet.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.StoreMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PointVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

	@Autowired
	public StoreMapper mapper;

	//상품에 대한 별점 평균
	@Override
	public List<BoardVO> getStorerate(Criteria cri) {
		log.info("getStorerate/cri");
		cri.setAmount(8);
		return mapper.getStorerate(cri);
	}

	//상품 전체 정보 
	@Override
	public List<BoardVO> getGoodsinfo() {
		log.info("getGoodsinfo");
		return mapper.getGoodsinfo();
	}
	
	//베스트 상품 총 개수	
	@Override
	public List<BoardVO> getGoodscount() {
		log.info("getGoodscount");
		return mapper.getGoodscount();
	}
	
	//베스트 상품에 대한 별점 평균
	@Override
	public List<BoardVO> getBestrate(BoardVO boardVO, Criteria cri) {
		log.info("getBestrate");
		cri.setAmount(8);
		return mapper.getBestrate(boardVO, cri);
	}
	
	//카테고리별 베스트 상품 총 개수	
	@Override
	public List<BoardVO> getBestcount(int code) {
		log.info("getBestcount");
		return mapper.getBestcount(code);
	}

	//카테고리 조회
	@Override
	public List<CategoryVO> getCategory() {
		log.info("getCategory");
		return mapper.getCategory();
	}
	
	//이벤트(7일) 참여 조회
	@Override
	public int getEventstatus(PointVO pointVO) {
		log.info("getEventstatus");
		return mapper.getEventstatus(pointVO);	
	}
	
	//포인트 점수 저장
	@Override
	public void point(PointVO pointVO) {
		log.info("point");
		mapper.point(pointVO);
	}

	//커뮤니티 노하우 조회
	@Override
	public List<ImageVO> getKnowhow() {
		log.info("getKnowhow");
		return mapper.getKnowhow();
	}

	//커뮤니티 SNS 조회
	@Override
	public List<ImageVO> getSns() {
		log.info("getSns");
		return mapper.getSns();
	}

	//해당 SNS 댓글 총 개수
	@Override
	public List<BoardVO> getCommentcount() {
		log.info("getCommentcount");
		return mapper.getCommentcount();
	}
}
