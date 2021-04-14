package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.pet.ex.service.SnsService;
import com.pet.ex.vo.BoardVO;
 
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;
 

@Slf4j
@RestController
@RequestMapping("/commu")
public class SnsController {

	@Autowired
	private SnsService service;

	// sns홈
	@RequestMapping("/sns")
	public ModelAndView SNS(Criteria cri, ModelAndView mav) throws Exception {

		log.info("sns");
		
		mav.addObject("list", service.getsnsList(cri));
		
		mav.setViewName("sns/sns_list");

		return mav;
	}
	
	@PostMapping("/sns/morelist")
	public Map<String, Object> snsMorelist(Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> sns = service.getsnsList(cri);
		list.put("sns", sns);
		return list;
	}
	
	@RequestMapping("/sns/modify_view")
	public ModelAndView modify_view(@PathVariable("board_id") int board_id, BoardVO boardVO, ModelAndView mav) throws Exception {
		boardVO = service.getBoardInfo(board_id);
		log.info("modify_view");
		
		mav.addObject("sns", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		
		mav.setViewName("sns/sns_modify");

		return mav;
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
	public ModelAndView contentView(@PathVariable("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {

		boardVO = service.getBoardInfo(board_id);

		log.info("SNS_View");

		mav.addObject("comment", service.listComment(boardVO.getBoard_id()));
		log.info("SNS_View");

		int count = service.counta(board_id);
		
		mav.addObject("sns", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		mav.addObject("count", count);
	 
		System.out.println(count);
		service.hit(boardVO.getBoard_id());

		mav.setViewName("sns/sns_contentView");

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

 
	
	@GetMapping("/myHome")
	public ModelAndView myPageHome(MemberVO memberVO, @RequestParam("member_id") String member_id, ModelAndView mav) throws Exception {

		log.info("ex");
		
		mav.addObject("user", service.getMemberInfo(memberVO.getMember_id()));
		mav.setViewName("myPage/myPageHome");

		return mav;
	}
	
 
	

}
