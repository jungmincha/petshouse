package com.pet.ex.controller;

//jungmin2브랜치 등록
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.security.handlers.MyAuthentication;
import com.pet.ex.service.CommunityService;
import com.pet.ex.service.MapService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.FollowVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/map")
public class MapController {

	private MapService service;

	// 펫츠타운 위치기반동의 페이지
	@GetMapping("/home")
	public ModelAndView map(ModelAndView mav) {

		mav.setViewName("map/home");

		return mav;
	}

	// 펫츠타운 메인페이지
	@RequestMapping("/board")
	public ModelAndView board(String location, String nickname, ModelAndView mav, Criteria cri, MemberVO memberVO,
			BoardVO boardVO, ImageVO imageVO, PlikeVO plikeVO, String member_id, Authentication authentication) {
		
		
		
		memberVO.setLocation(location); // 명동 받아옴

		service.insertLoc(memberVO); // 홍제 2동 삽입된

		boardVO.setLocation(location); // 여기서도 홍제 2동 삽입됨

		mav.addObject("list", service.getList(cri));

		int total = service.getTotal(cri);

		mav.addObject("pageMaker", new PageVO(cri, total));

		// 위치
		mav.addObject("location", location);

		// 닉네임
		mav.addObject("nickname", nickname);
		// 아이디
		mav.addObject("member_id", member_id);

		// mav.addObject("image" );
		mav.addObject("like_print", service.getLikeprint());
		mav.setViewName("map/board");
		
		return mav;
	}

	// 글작성 양식
	@GetMapping("/write_view")
	public ModelAndView write_view(String location, String member_id, String nickname, ModelAndView mav,
			BoardVO boardVO) {

		log.info("write_view...");

		mav.addObject("location", location);
		mav.addObject("member_id", member_id);
		mav.addObject("nickname", nickname);
		mav.setViewName("map/write_view");

		return mav;
	}

	// content_view 페이지
	@GetMapping("/board/{board_id}")
	public ModelAndView content_view(String location, String member_id, String nickname,
			ModelAndView mav, BoardVO boardVO, ImageVO imageVO, MemberVO memberVO, PlikeVO plikeVO,
			MyAuthentication myAuthentication) {
		// 현재 접속 닉네임
		String pre_nickname = myAuthentication.getMember().getNickname();

		mav.addObject("location", location);
		mav.addObject("member_id", member_id);
		mav.addObject("nickname", nickname);
		mav.addObject("comment", service.listComment(boardVO.getBoard_id()));

		// 조회수 기능
		service.hit(boardVO.getBoard_id());

		log.info("rest_content_view...");

		// 게시물 내용 출력
		mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));

		// 좋아요 기능 구현 -START-

		// resultmap에 vo 담아주는 거
		MemberVO member = new MemberVO();
		plikeVO.setMemberVO(member);
		plikeVO.getMemberVO().setMember_id(pre_nickname);

		BoardVO board = new BoardVO();
		plikeVO.setBoardVO(board);
		plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());

		// 좋아요 수
		mav.addObject("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
		// 좋아요 유무 체크
		mav.addObject("likecheck", service.isLike(plikeVO));
		// 좋아요 리스트
		mav.addObject("likelist", service.getLikelist(plikeVO));
		// 좋아요 기능 구현 -END-
		System.out.println(
				"===========ddd===============================================================================");

		mav.setViewName("map/content_view");
		return mav;

	}

	// 게시글 수정 할 수 있는 페이지 띄움
	@GetMapping("/modify_view/{board_id}")
	public ModelAndView modify_view(String location, String member_id, String nickname, ModelAndView mav,
			BoardVO boardVO) {

		log.info("modify_view...");

		mav.addObject("location", location);

		mav.addObject("member_id", member_id);
		mav.addObject("content_view", service.content_view(boardVO.getBoard_id()));
		mav.addObject("nickname", nickname);

		mav.setViewName("map/modify_view");

		return mav;
	}

	// 메인페이지에서 게시글 작성
	@RequestMapping("/write") // 글작성 폼에서 정보입력(즉, insert)
	public ModelAndView write(

			String location, String member_id, String nickname, ModelAndView mav, ImageVO imageVO, BoardVO boardVO,
			MemberVO memberVO, Criteria cri, MultipartHttpServletRequest multi) throws Exception

	{
		log.info("write");

		MemberVO member = new MemberVO();
		boardVO.setMemberVO(member);
		boardVO.getMemberVO().setLocation(location);
		boardVO.getMemberVO().setMember_id(member_id);
		boardVO.getMemberVO().setNickname(nickname);

		service.write(boardVO);

		mav.addObject("list", service.getList(cri));

		int total = service.getTotal(cri);

		mav.addObject("pageMaker", new PageVO(cri, total));

		memberVO.setLocation(location);

		service.insertLoc(memberVO);

		mav.addObject("location", location);

		mav.addObject("member_id", member_id);
		mav.addObject("nickname", nickname);

		// 사진 업로드
		String path = multi.getSession().getServletContext().getRealPath("/static/img/location");

		path = path.replace("webapp", "resources");

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사

			UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경

			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName); // 저장 될 파일명
			String imgname = uuid + "." + ext;

			String savePath = path + "\\" + imgname; // 저장 될 파일 경로

			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			// imageVO.setImgname(imgname);
			// imageVO.getBoardVO().setBoard_id(boardVO.getBoard_id());

			// service.detailInput(imageVO);

		}

		mav.setViewName("redirect:board");
		return mav;

	}

	// 게시글 수정
	@RequestMapping("/modify") // 글작성 폼에서 정보수정(즉, update)
	public ModelAndView modify(String location, String member_id, String nickname, ModelAndView mav, ImageVO imageVO,
			BoardVO boardVO, MemberVO memberVO, Criteria cri, MultipartHttpServletRequest multi) throws Exception

	{
		log.info("modify");

		mav.addObject("list", service.getList(cri));

		int total = service.getTotal(cri);

		mav.addObject("pageMaker", new PageVO(cri, total));

		memberVO.setLocation(location);

		service.insertLoc(memberVO);

		mav.addObject("location", location);

		mav.addObject("member_id", member_id);
		mav.addObject("nickname", nickname);

		service.modify(boardVO);

		/*
		 * String path =
		 * multi.getSession().getServletContext().getRealPath("/static/img/location");
		 * 
		 * path = path.replace("webapp", "resources");
		 * 
		 * File dir = new File(path); if (!dir.isDirectory()) { dir.mkdir(); }
		 * 
		 * List<MultipartFile> mf = multi.getFiles("file");
		 * 
		 * 
		 * for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
		 * 
		 * UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경
		 * 
		 * String originalfileName = mf.get(i).getOriginalFilename(); String ext =
		 * FilenameUtils.getExtension(originalfileName); //저장 될 파일명 String
		 * imgname=uuid+"."+ext;
		 * 
		 * 
		 * String savePath = path + "\\" + imgname; // 저장 될 파일 경로
		 * 
		 * 
		 * 
		 * System.out.println(
		 * "============================================================================="
		 * ); System.out.println(savePath);
		 * 
		 * mf.get(i).transferTo(new File(savePath)); // 파일 저장
		 * imageVO.setImgname(imgname);
		 * imageVO.getBoardVO().setBoard_id(boardVO.getBoard_id()); System.out.println(
		 * "============================================================================="
		 * ); System.out.println(boardVO.getBoard_id());
		 * 
		 * service.detailInput(imageVO);
		 * 
		 * 
		 * 
		 * }
		 */

		mav.setViewName("redirect:board");
		return mav;

	}

	// 댓글 작성
	@PostMapping("/map_view/insert")
	public BoardVO insertComment(BoardVO boardVO, Model model,

			String location, String member_id, String nickname)

	{
		MemberVO member = new MemberVO();

		boardVO.setMemberVO(member);

		boardVO.getMemberVO().setMember_id(member_id);

		// 댓글 입력
		service.insertComment(boardVO);

		// 댓글 출력
		BoardVO comments = service.getComment(boardVO.getPgroup());

		return comments;
	}

	// 댓글 삭제 ajax 사용
	@DeleteMapping("/map_view/delete/{board_id}")
	public ResponseEntity<String> reply_delete(BoardVO boardVO) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {

			service.deleteComment(boardVO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// content_view 에서 게시글 삭제
	@RequestMapping("/delete")
	public ModelAndView delete(

			int board_id, String location, String member_id, String nickname, ModelAndView mav, BoardVO boardVO,
			MemberVO memberVO) throws Exception {

		log.info("delete");
		service.inputDelete(board_id);

		memberVO.setLocation(location);

		service.insertLoc(memberVO);

		mav.addObject("location", location);

		mav.addObject("member_id", member_id);
		mav.addObject("nickname", nickname);

		mav.setViewName("redirect:board");

		return mav;
	}

	// 해시태그 (수정중)
	@GetMapping("/location/tag")
	public List<BoardVO> tag(String hashtag, String location, Criteria cri, BoardVO boardVO) throws Exception {

		List<BoardVO> list = new ArrayList<BoardVO>();

		if (hashtag == null) {

			list = service.getList(cri);
		} else {
			MemberVO member = new MemberVO();
			boardVO.setMemberVO(member);
			boardVO.getMemberVO().setLocation(location);
			boardVO.setHashtag(hashtag);
			list = service.getHashtag(boardVO);
		}

		System.out.println("===확인====" + hashtag);
		System.out.println("===확인====" + location);
		log.info("hashtag...");
		return list;
	}

	// 좋아요 기능 -START-

	// 좋아요 입력
	@PostMapping("/like/{board_id}")
	public Map<String, Object> like(PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO,
			MyAuthentication myAuthentication) {
		log.info("LIKE");

		String pre_nickname = myAuthentication.getMember().getNickname();

		// resultmap에 vo 담아주는 거
		MemberVO member = new MemberVO();
		plikeVO.setMemberVO(member);
		plikeVO.getMemberVO().setMember_id(pre_nickname);
		// plikeVO.getMemberVO().setNickname(nickname);
		BoardVO board = new BoardVO();
		plikeVO.setBoardVO(board);
		plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());

		// plikeVO.setMember_id(member_id);

		Map<String, Object> map = new HashMap<>();
		try {
			service.like(plikeVO);
			map.put("SUCCESS", HttpStatus.OK);
			map.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));

			List<PlikeVO> likelist = service.getLikelist(plikeVO);
			map.put("likelist", likelist);

			// BOARD테이블의 plike 숫자 증가
			service.insertplike(boardVO);

			System.out
					.println("=====================ssss==============================================================");

		} catch (Exception e) {
			e.printStackTrace();
			map.put("SUCCESS", HttpStatus.BAD_REQUEST);
		}
		return map;
	}

	// 좋아요 취소
	@DeleteMapping("/likecancel/{board_id}")
	public Map<String, Object> likecancel(PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO,
			MyAuthentication myAuthentication) {
		log.info("likecancel");
		String pre_nickname = myAuthentication.getMember().getNickname();

		// resultmap에 vo 담아주는 거
		MemberVO member = new MemberVO();
		plikeVO.setMemberVO(member);
		plikeVO.getMemberVO().setMember_id(pre_nickname);
		// plikeVO.getMemberVO().setMember_id(nickname);
		BoardVO board = new BoardVO();
		plikeVO.setBoardVO(board);
		plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());

		// plikeVO.setMember_id(member_id);

		Map<String, Object> map = new HashMap<>();
		try {
			service.likecancel(plikeVO);
			map.put("SUCCESS", HttpStatus.OK);
			map.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));

			List<PlikeVO> likelist = service.getLikelist(plikeVO);
			map.put("likelist", likelist);
			// BOARD테이블의 plike 숫자 감소
			service.deleteplike(boardVO);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("SUCCESS", HttpStatus.BAD_REQUEST);
		}
		return map;
	}

	// 좋아요 기능 -END-

}
