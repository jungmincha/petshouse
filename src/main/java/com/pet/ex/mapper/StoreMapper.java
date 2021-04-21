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
	public List<BoardVO> getStorerate(Criteria cri);

	public List<BoardVO> getGoodsinfo();
	
	public List<BoardVO> getBestrate(BoardVO boardVO, Criteria cri);
	
	public List<CategoryVO> getCategory();
	
	public void point(PointVO pointVO);
	
	public int getEventstatus(PointVO pointVO);

	//커뮤니티 노하우 조회
	public List<ImageVO> getKnowhow();

	//커뮤니티 SNS 조회
	public List<ImageVO> getSns();
}
