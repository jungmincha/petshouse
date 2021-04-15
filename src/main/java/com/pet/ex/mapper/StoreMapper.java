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
	
	public List<BoardVO> getBestrate(int category_id);
	
	public List<CategoryVO> getCategory();
	
	public void point(PointVO pointVO);
	
	public int getEventstatus(PointVO pointVO);

	//커뮤니티 노하우 조회
	public List<BoardVO> getKnowhow();

	//커뮤니티 SNS 조회
	public List<ImageVO> getSns();

	//회원 정보 조회
	public MemberVO getMemberinfo();

	//팔로워 수 조회
	public int getFollowertotal(String page_id);

	//팔로잉 수 조회
	public int getFolloingtotal(String member_id);

	//팔로우 유무 체크
	public int isFollow(FollowVO followVO);
	
	//팔로워 리스트 조회
	public List<FollowVO> getFollowerlist(FollowVO followVO);
	
	//팔로잉 리스트 조회
	public List<FollowVO> getFollowinglist(FollowVO followVO);

	//팔로우
	public void follow(FollowVO followVO);

	//언팔로우
	public void unfollow(FollowVO followVO);

}
