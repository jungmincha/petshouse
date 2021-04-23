package com.pet.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pet.ex.mapper.MyhomeMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class MyhomeServiceImpl implements MyhomeService {

	private MyhomeMapper mapper;

	//팔로우하려는 회원 정보 조회
	@Override
	public MemberVO getMemberInfo(String nickname) {
		log.info("getMemberInfo");
		return mapper.getMemberInfo(nickname);
	}

	//현재 호그인한 회원 닉네임 조회
	@Override
	public String getFollowernick(String follower_id) {
		log.info("getFollowernick");
		return mapper.getFollowernick(follower_id);
	}
	
	//팔로워 수 조회
	@Override
	public int getFollowertotal(String member_id) {
		log.info("getFollowertotal");
		return mapper.getFollowertotal(member_id);
	}

	//팔로잉 수 조회
	@Override
	public int getFolloingtotal(String nickname) {
		log.info("getFolloingtotal");
		return mapper.getFolloingtotal(nickname);
	}

	//팔로우 유무 체크
	@Override
	public int isFollow(FollowVO followVO) {
		log.info("isFollow");
		return mapper.isFollow(followVO);
	}
	
	//팔로워 리스트 조회
	@Override
	public List<FollowVO> getFollowerlist(FollowVO followVO) {
		log.info("getFollowerlist");
		return mapper.getFollowerlist(followVO);
	}

	//팔로잉 리스트 조회
	@Override
	public List<MemberVO> getFollowinglist(FollowVO followVO) {
		log.info("getFollowinglist");
		return mapper.getFollowinglist(followVO);
	}

	//팔로우 
	@Override
	public void follow(FollowVO followVO) {
		log.info("follow");
		mapper.follow(followVO);	
	}

	//언팔로우 
	@Override
	public void unfollow(FollowVO followVO) {
		log.info("unfollow");
		mapper.unfollow(followVO);	
	}

	//회원 정보 수정
	@Override
	public void memberModify(MemberVO memberVO) {
		log.info("memberModify");
		mapper.memberModify(memberVO);
	}

	//본인이 작성한 SNS 조회
	@Override
	public List<ImageVO> getSnslist(MemberVO memberVO, Criteria cri) {
		log.info("getSnslist");
		cri.setAmount(9);
		return mapper.getSnslist(memberVO, cri);
	}
	
	//본인이 작성한 SNS 글개수 조회
	@Override
	public int getSnstotal(String member_id) {
		log.info("getSnstotal");
		return mapper.getSnstotal(member_id);
	}

	//본인이 작성한 노하우 조회
	@Override
	public List<ImageVO> getKnowhowlist(MemberVO memberVO, Criteria cri) {
		log.info("getKnowhowlist");
		cri.setAmount(9);
		return mapper.getKnowhowlist(memberVO, cri);
	}
	
	//본인이 작성한 노하우 글개수 조회
	@Override
	public int getKnowhowtotal(String member_id) {
		log.info("getKnowhowtotal");
		return mapper.getKnowhowtotal(member_id);
	}

	//본인이 작성한 리뷰 조회
	@Override
	public List<BoardVO> getReviewlist(MemberVO memberVO, Criteria cri) {
		log.info("getReviewlist");
		cri.setAmount(1);
		return mapper.getReviewlist(memberVO, cri);
	}
	
	//본인이 작성한 리뷰 글개수 조회
	@Override
	public int getReviewtotal(String member_id) {
		log.info("getReviewtotal");
		return mapper.getReviewtotal(member_id);
	}
	
	//상품에 대한 리뷰 점수 평균
	@Override
	public List<BoardVO> getGoodsscore() {
		log.info("getGoodsscore");
		return mapper.getGoodsscore();
	}
	
	//본인이 작성한 질답 조회
	@Override
	public List<BoardVO> getQnalist(MemberVO memberVO, Criteria cri){
		log.info("getQnalist");
		cri.setAmount(10);
		return mapper.getQnalist(memberVO, cri);
	}
	
	//본인이 작성한 질답 글개수 조회
	@Override
	public int getQnatotal(String member_id) {
		log.info("getQnatotal");
		return mapper.getQnatotal(member_id);
	}
}
