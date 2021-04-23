package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.page.Criteria;
import com.pet.ex.service.MyhomeService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/myPage")
public class Myhomecontroller {

	@Autowired
	private MyhomeService service;
	
	//마이페이지 전체 출력, 팔로우
	@GetMapping("/{nickname}")
	public ModelAndView myPageHome(Criteria cri, MemberVO memberVO, FollowVO followVO, Authentication authentication, ModelAndView mav) throws Exception {
		log.info("myPageHome");
		//팔로우하려는 회원 계정
		memberVO = service.getMemberInfo(memberVO.getNickname());
		followVO.setMemberVO(memberVO);
 
		//회원 본인 계정
		String follower_id = authentication.getPrincipal().toString();	
		followVO.setFollower_id(service.getFollowernick(follower_id));
		
		//팔로워&팔로잉 수  
		mav.addObject("follower", service.getFollowertotal(followVO.getMemberVO().getMember_id()));
		mav.addObject("following", service.getFolloingtotal(followVO.getMemberVO().getNickname()));
		//팔로우 유무 체크
		mav.addObject("followcheck", service.isFollow(followVO));
		//팔로워&팔로잉 리스트 
		mav.addObject("followerlist", service.getFollowerlist(followVO));
		mav.addObject("followinglist", service.getFollowinglist(followVO));
			
		//회원 정보 및 작성한 게시글 출력
		mav.addObject("member", service.getMemberInfo(memberVO.getNickname()));
		mav.addObject("sns", service.getSnslist(memberVO, cri));
		mav.addObject("snsTotal", service.getSnstotal(memberVO.getMember_id()));
		
		mav.addObject("knowhow", service.getKnowhowlist(memberVO, cri));
		mav.addObject("knowhowTotal", service.getKnowhowtotal(memberVO.getMember_id()));
		
		mav.addObject("review", service.getReviewlist(memberVO, cri));
		mav.addObject("reviewTotal", service.getReviewtotal(memberVO.getMember_id()));
		mav.addObject("goodsscore", service.getGoodsscore());
		
		mav.addObject("qna", service.getQnalist(memberVO, cri));
		mav.addObject("qnaTotal", service.getQnatotal(memberVO.getMember_id()));
		
		mav.setViewName("myPage/myhome");

		return mav;
	}
	
	//sns 전체 출력
//	@GetMapping("/sns")
//	public ModelAndView sns(@RequestParam("nickname") String nickname, MemberVO memberVO, Criteria cri, ModelAndView mav) throws Exception {
//		log.info("more_sns");
//		memberVO.setNickname(nickname);
//		memberVO = service.getMemberInfo(memberVO.getNickname());
//		mav.addObject("sns", service.getSnslist(memberVO, cri));
//		mav.addObject("snsCount", service.getSnscount(memberVO.getMember_id()));
//		
//		mav.setViewName("myPage/mysns");
//		return mav;
//	}
	
	//sns 더보기 
	@GetMapping("/moresns/{nickname}")
	public Map<String, Object> moresns(MemberVO memberVO, Criteria cri) {
		log.info("more_sns");
		memberVO = service.getMemberInfo(memberVO.getNickname());
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> sns = service.getSnslist(memberVO, cri);
		list.put("sns", sns);
		list.put("snsTotal", service.getSnstotal(memberVO.getMember_id()));
		return list;
	}

	//노하우 전체 출력
	@GetMapping("/knowhow")
	public ModelAndView knowhow(@RequestParam("nickname") String nickname, MemberVO memberVO, Criteria cri, ModelAndView mav) throws Exception {
		log.info("more_knowhow");
		memberVO.setNickname(nickname);
		memberVO = service.getMemberInfo(memberVO.getNickname());
		mav.addObject("knowhow", service.getKnowhowlist(memberVO, cri));
		mav.addObject("knowhowCount", service.getKnowhowtotal(memberVO.getMember_id()));
		
		mav.setViewName("myPage/myknowhow");
		return mav;
	}
	
	//리뷰 전체 출력
	@GetMapping("/review")
	public ModelAndView review(@RequestParam("nickname") String nickname, MemberVO memberVO, Criteria cri, ModelAndView mav) throws Exception {
		log.info("more_review");
		memberVO.setNickname(nickname);
		memberVO = service.getMemberInfo(memberVO.getNickname());
		mav.addObject("review", service.getReviewlist(memberVO, cri));
		mav.addObject("reviewTotal", service.getReviewtotal(memberVO.getMember_id()));
		mav.addObject("goodsscore", service.getGoodsscore());
		
		mav.setViewName("myPage/myreview");
		return mav;
	}
	
	//Q&A 전체 출력
	@GetMapping("/qna")
	public ModelAndView qna(@RequestParam("nickname") String nickname, MemberVO memberVO, Criteria cri, ModelAndView mav) throws Exception {
		log.info("more_qna");
		memberVO.setNickname(nickname);
		memberVO = service.getMemberInfo(memberVO.getNickname());
		mav.addObject("qna", service.getQnalist(memberVO, cri));
		mav.addObject("qnaCount", service.getQnatotal(memberVO.getMember_id()));
		
		mav.setViewName("myPage/myqna");
		return mav;
	}
	
	//팔로우
	@PostMapping("/follow/{nickname}")
	public Map<String, Object> follow(MemberVO memberVO, FollowVO followVO, Authentication authentication) {
		log.info("follow");
		memberVO = service.getMemberInfo(memberVO.getNickname());
		followVO.setMemberVO(memberVO);
		
		//System.out.println(memberVO.getNickname());
		String follower_id = authentication.getPrincipal().toString();	
		followVO.setFollower_id(service.getFollowernick(follower_id));
		System.out.println(service.getFollowernick(follower_id));

		Map<String, Object> map = new HashMap<>();
		try {	
			service.follow(followVO);
			map.put("SUCCESS", HttpStatus.OK);
			map.put("follower", service.getFollowertotal(followVO.getMemberVO().getMember_id()));
		
			List<FollowVO> followerlist = service.getFollowerlist(followVO);
			map.put("followerlist", followerlist);
				
		} catch (Exception e) {
			e.printStackTrace();
			map.put("SUCCESS", HttpStatus.BAD_REQUEST);
		}
		return map;
	}
		
	//언팔로우
	@PostMapping("/unfollow/{nickname}")
	public Map<String, Object> unfollow(MemberVO memberVO, FollowVO followVO, Authentication authentication) {
		log.info("unfollow");
		memberVO = service.getMemberInfo(memberVO.getNickname());
		followVO.setMemberVO(memberVO);
		System.out.println(followVO.getMemberVO().getMember_id()); 
		
		//System.out.println(memberVO.getNickname());
		String follower_id = authentication.getPrincipal().toString();	
		followVO.setFollower_id(service.getFollowernick(follower_id));
		System.out.println(service.getFollowernick(follower_id));
			
		Map<String, Object> map = new HashMap<>();	
		try {	
			service.unfollow(followVO);
			map.put("SUCCESS", HttpStatus.OK);
			map.put("follower", service.getFollowertotal(followVO.getMemberVO().getMember_id()));
				
			//List<FollowVO> followerlist = service.getFollowerlist(followVO);
			map.put("followerlist", service.getFollowerlist(followVO));
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("SUCCESS", HttpStatus.BAD_REQUEST);
		}
		return map;
	}	

	//프로필 사진 수정
	@GetMapping("/view")
	public ModelAndView member_modify_View(ModelAndView mav) throws Exception {
		mav.setViewName("myPage/profileModify");
		return mav;
	}

	//회원 정보 수정
	@PostMapping("/modify")
	public ModelAndView profile_modify(MultipartHttpServletRequest multi, MemberVO memberVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("profile_modify");
		String path = multi.getSession().getServletContext().getRealPath("/static/img/member/profile");
		path = path.replace("webapp", "resources");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		List<MultipartFile> mf = multi.getFiles("file");
		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
			UUID uuid = UUID.randomUUID();
			// 본래 파일명
			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName);
			String thumbnail = uuid + "." + ext;
			String savePath = path + "\\" + thumbnail; // 저장 될 파일 경로
			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			memberVO.setThumbnail(thumbnail);
		}
		service.memberModify(memberVO);
		mav.setView(new RedirectView("view", true));

		return mav;
	}
}
