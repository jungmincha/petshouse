package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PointVO;

@Mapper
public interface StoreMapper {	
	//상품에 대한 별점 평균
	public List<BoardVO> getStorerate(Criteria cri);

	//상품 전체 정보 
	public List<BoardVO> getGoodsinfo();
	
	//베스트 상품 총 개수
	public List<BoardVO> getGoodscount();
	
	//베스트 상품에 대한 별점 평균
	public List<BoardVO> getBestrate(BoardVO boardVO, Criteria cri);
	
	//카테고리별 베스트 상품 총 개수
	public List<BoardVO> getBestcount(int code);

	//카테고리 조회
	public List<CategoryVO> getCategory();

	//이벤트(7일) 참여 조회
	public int getEventstatus(PointVO pointVO);

	//포인트 점수 저장
	public void point(PointVO pointVO);

	//커뮤니티 노하우 조회
	public List<ImageVO> getKnowhow();

	//커뮤니티 SNS 조회
	public List<ImageVO> getSns();

}
