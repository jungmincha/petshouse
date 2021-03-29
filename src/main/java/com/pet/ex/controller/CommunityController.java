package com.pet.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.CommunityService;
import com.pet.ex.vo.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/commu")
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// 질문과 답변 페이지 리스트 출력 (검색, 키워드, 글쓰기,사진업로드, 페이징, 댓글, 수정, 삭제, 조회 필요함)
	@RequestMapping("/qna")
	public ModelAndView qna(Criteria cri, ModelAndView mav) {
		mav.addObject("qna", communityService.getQnaList(cri));
		int total = communityService.getTotal(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("community/qna"); // 파일경로
		return mav;

	}

	// 질문과 답변 특정 글 페이지 출력
	@GetMapping("/qna_view")
	public ModelAndView qna_view(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("qna_view()실행");
		mav.addObject("qna_view", communityService.getQnaview(boardVO.getBoard_id())); // 특정 글 출력
		// communityService.hit(boardVO.getBoard_id()); 조회수어쩔거임
		mav.setViewName("community/qna_view");
		return mav;
	}

	// 질문과 답변 글쓰기 페이지
	@GetMapping("/qna_write")
	public ModelAndView qna_write(ModelAndView mav) throws Exception {
		log.info("qna_write()실행");
		mav.setViewName("community/qna_write");
		return mav;
	}

	// 글 작성하기 질문과답변, 노하우...
	@PostMapping("/qna")
	public ModelAndView write(BoardVO boardVO,ModelAndView mav) throws Exception {
		log.info("write()실행");
		communityService.writeQnt(boardVO);
		mav.setView(new RedirectView("/commu/qna",true));
		return mav;
	}
	
	//글 수정하기
	@PostMapping("/modify")
	public ModelAndView modify(Criteria cri, BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("modify()실행");
		mav.addObject("qna", communityService.getQnaList(cri));
		communityService.modify(boardVO);
		mav.setViewName("community/qna");       
		return mav;
	}

	//글 삭제하기
	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam("board_id") int board_id,Criteria cri, ModelAndView mav) throws Exception {
		log.info("delete()실행");
		mav.addObject("qna", communityService.getQnaList(cri));
		communityService.delete(board_id);
		mav.setView(new RedirectView("/commu/qna",true));
		return mav;
	}

	// 여기서부턴 댓글기능입니다... 아직..이에요.. xml에서 resultMap도 수정해야하구요...

}
