package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

public interface MyhomeService {
	//팔로우하려는 회원 정보 조회
	public MemberVO getMemberInfo(String nickname);

	//현재 호그인한 회원 닉네임 조회
	public String getFollowernick(String follower_id); 	
	
	//팔로워 수 조회
	public int getFollowertotal(String member_id);

	//팔로잉 수 조회
	public int getFolloingtotal(String nickname);

	//팔로우 유무 체크
	public int isFollow(FollowVO followVO);
		
	//팔로워 리스트 조회
	public List<FollowVO> getFollowerlist(FollowVO followVO);

	//팔로잉 리스트 조회
	public List<MemberVO> getFollowinglist(FollowVO followVO);

	//팔로우 
	public void follow(FollowVO followVO);
		
	//언팔로우 
	public void unfollow(FollowVO followVO);

	//회원 정보 수정
	public void memberModify(MemberVO memberVO);

	//본인이 작성한 SNS 조회
	public List<ImageVO> getSnslist(String member_id);

	//본인이 작성한 노하우 조회
	public List<BoardVO> getKnowhowlist(String member_id);

	//본인이 작성한 질답 조회
	public List<BoardVO> getQnalist(String member_id);

	//본인이 작성한 리뷰 조회
	public List<BoardVO> getReviewlist(MemberVO memberVO, Criteria cri);

	public int getSnscount(String member_id); 	

}
