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
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.pet.ex.page.PageVO;
import com.pet.ex.security.handlers.MyAuthentication;
import com.pet.ex.service.SnsService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

import lombok.extern.slf4j.Slf4j;
 

@Slf4j
@RestController
@RequestMapping("/commu")
public class SnsController {

	@Autowired
	private SnsService service;

	// sns홈
	@RequestMapping("/sns")
	public ModelAndView SNS(Criteria cri, BoardVO boardVO, ModelAndView mav) throws Exception {

		log.info("sns");
		
		mav.addObject("list", service.getsnsList(cri));
		 
		mav.setViewName("sns/sns_list");

		return mav;
	}
	
	//sns 더보기
	@PostMapping("/smorelist")
	public Map<String, Object> sns(Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> sns = service.getsnsList(cri);
		list.put("sns", sns);
		return list;
	}
	

	// sns 댓글 더보기
	@PostMapping("/scmorelist")
	public Map<String, Object> comment(@RequestParam("board_id") int board_id, Criteria cri) {
		log.info("commentsmorelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> comment = service.getcommentsList(cri, board_id);
		list.put("comment", comment);
		return list;
	}
	

	
	
	

	// sns 등록창
	@GetMapping("/sns/write_view")
	public ModelAndView write(ModelAndView mav) throws Exception {
		
		log.info("write");

		mav.setViewName("sns/sns_write");

		return mav;
	}

	// sns등록
	@PostMapping("/sns/write")
	public ModelAndView snsInput(MultipartHttpServletRequest multi, ImageVO imageVO, BoardVO boardVO, ModelAndView mav)
			throws IllegalStateException, IOException {

		log.info("snsInput");
		service.snsBoardInput(boardVO);

		String path = multi.getSession().getServletContext().getRealPath("/static/img/member/sns");

		path = path.replace("webapp", "resources");

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("btnAtt");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사

			UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경

			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName);
			// 저장 될 파일명
			String imgname = uuid + "." + ext;

			String savePath = path + "\\" + imgname; // 저장 될 파일 경로

			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			imageVO.setImgname(imgname);
			BoardVO board = service.getSnsBoard_id();
			imageVO.getBoardVO().setBoard_id(board.getBoard_id());
			service.snsImgInput(imageVO);

		}

		mav.setView(new RedirectView("/commu/sns", true));

		return mav;

	}

	@GetMapping("/sns/{board_id}")
	public ModelAndView contentView(@PathVariable("board_id") int board_id,  MyAuthentication myAuthentication ,PlikeVO plikeVO ,BoardVO boardVO, MemberVO memberVO, Criteria cri, ModelAndView mav)
			throws Exception {

		boardVO = service.getBoardInfo(board_id);
		//현재 접속 아이디
		String pre_nickname= myAuthentication.getMember().getNickname();

		log.info("SNS_View");

		mav.addObject("comment", service.listComment(boardVO.getBoard_id(),cri));
		log.info("SNS_View");

		int count = service.counta(board_id);
		String nickname = service.getNickname(board_id);
	
		
	
		System.out.println("000000-------------------------------dddd-------------44444444444ooooooooooooooooo");
		System.out.println(nickname);
	
		mav.addObject("user",  service.getUserboard(nickname));
		 
		mav.addObject("sns", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		mav.addObject("count", count);
		
		//좋아요 start
		//좋아요 출력
	
		
		MemberVO member = new MemberVO();
		plikeVO.setMemberVO(member);
		plikeVO.getMemberVO().setMember_id(pre_nickname);
		BoardVO board = new BoardVO();
		plikeVO.setBoardVO(board);
		plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
		
		//좋아요 수 
		mav.addObject("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
		//좋아요 유무 체크
		mav.addObject("likecheck", service.isLike(plikeVO));
		//좋아요 리스트 
		mav.addObject("likelist", service.getLikelist(plikeVO));
		
		//좋아요 end
	 
		System.out.println(count);
		service.hit(boardVO.getBoard_id());

		mav.setViewName("sns/sns_contentView");

		return mav;
	}
	
	// sns 수정페이지
	@GetMapping("/sns/modify_view")
	public ModelAndView modify_view(@RequestParam("board_id") int board_id, BoardVO boardVO, ModelAndView mav) throws Exception {
		
		 
		log.info("modify_view");
		
		mav.addObject("sns", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		
		mav.setViewName("sns/sns_modify");

		return mav;
	}
	
	// sns 수정
	@PostMapping("/sns/modify")
	public ModelAndView modifySNS(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("sns_modify");
		service.modifySns(boardVO);
		mav.setView(new RedirectView("/commu/sns", true));
		return mav;
	}
	
	// sns 삭제하기
	@GetMapping("/sns/delete")
		public ModelAndView deleteSNS(@RequestParam("board_id") int board_id, Criteria cri, ModelAndView mav)
				throws Exception {
			log.info("delete()실행");
			
			service.deleteSns(board_id);
			mav.setView(new RedirectView("/commu/sns", true));
			return mav;
		}

	// sns 댓글 작성
	@PostMapping("/sns/comment")
	public BoardVO insertComment(BoardVO boardVO, @RequestParam("member_id") String member_id) {

		MemberVO member = new MemberVO();
		boardVO.setMemberVO(member);
		boardVO.getMemberVO().setMember_id(member_id);
		service.insertComment(boardVO);
		BoardVO comments = service.getComment(boardVO.getPgroup());
		System.out.println(comments);
		return comments;
	}
	
	//댓글 삭제하기
		@RequestMapping("/comment/delete")
		public ResponseEntity<String> deleteComment(BoardVO boardVO) {

			ResponseEntity<String> entity = null;
			log.info("delete");

			try {
				service.deleteComment(boardVO);
				System.out.println("===========");
				
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();

				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}

			return entity;

		}

 
		//좋아요 기능 -START-
		//좋아요 입력
			@PostMapping("/sns/like/{board_id}")
			public Map<String, Object> like(@PathVariable("board_id") int board_id  , MyAuthentication myAuthentication ,PlikeVO plikeVO, BoardVO boardVO ,MemberVO memberVO ) {
				log.info("LIKE");
				
				
			
				//현재 접속 아이디
				String pre_nickname= myAuthentication.getMember().getNickname();
				//resultmap에 vo 담아주는 거
				MemberVO member = new MemberVO();
				plikeVO.setMemberVO(member);
				plikeVO.getMemberVO().setMember_id(pre_nickname);
				
			
				BoardVO board = new BoardVO();
				plikeVO.setBoardVO(board);
				plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
		
				//plikeVO.setMember_id(member_id);
			
				Map<String, Object> map = new HashMap<>();
				try {	
					service.like(plikeVO);
					map.put("SUCCESS", HttpStatus.OK);
					map.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
			
					List<PlikeVO> likelist =  service.getLikelist(plikeVO);
					map.put("likelist", likelist);
					
					//BOARD테이블의 plike 숫자 증가
					service.insertplike(boardVO);
				
					System.out.println("=====================ssss==============================================================");
				
				} catch (Exception e) {
					e.printStackTrace();
					map.put("SUCCESS", HttpStatus.BAD_REQUEST);
				}
				return map;
			}
			
			//좋아요 취소
			@DeleteMapping("/sns/likecancel/{board_id}")
			public Map<String, Object> likecancel(@PathVariable("board_id") int board_id, MyAuthentication myAuthentication ,PlikeVO plikeVO, BoardVO boardVO , MemberVO memberVO) {
				log.info("likecancel");
				//현재 접속 아이디
				String pre_nickname= myAuthentication.getMember().getNickname();
			
				//resultmap에 vo 담아주는 거
				MemberVO member = new MemberVO();
				plikeVO.setMemberVO(member);
				plikeVO.getMemberVO().setMember_id(pre_nickname);
	
				BoardVO board = new BoardVO();
				plikeVO.setBoardVO(board);
				plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());
			
	
			
				Map<String, Object> map = new HashMap<>();	
				try {	
					service.likecancel(plikeVO);
					map.put("SUCCESS", HttpStatus.OK);
					map.put("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
					
					List<PlikeVO> likelist = service.getLikelist(plikeVO);
					map.put("likelist", likelist);
					//BOARD테이블의 plike 숫자 감소
					service.deleteplike(boardVO);
				} catch (Exception e) {
					e.printStackTrace();
					map.put("SUCCESS", HttpStatus.BAD_REQUEST);
				}
				return map;
			}
		
			//좋아요 기능 -END-

}
