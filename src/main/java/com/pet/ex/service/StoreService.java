package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PointVO;

public interface StoreService {	
	public List<BoardVO> getStorerate(Criteria cri);

	public List<BoardVO> getGoodsinfo();

	public List<BoardVO> getBestrate(int category_id);

	public List<CategoryVO> getCategory();
	
	public void point(PointVO pointVO);

	public int getEventstatus(PointVO pointVO);
	
	//커뮤니티 노하우 조회
	public List<BoardVO> getKnowhow();
	
	//커뮤니티 SNS 조회
	public List<BoardVO> getSns();

	//회원 정보 조회
	public MemberVO getMemberinfo();

	//팔로워 수 조회
	public int getFollowertotal(String member_id);

	//팔로잉 수 조회
	public int getFolloingtotal(String member_id);

	//팔로우 유무 체크
	public int isFollow(FollowVO followVO);
}
