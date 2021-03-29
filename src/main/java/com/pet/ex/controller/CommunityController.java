package com.pet.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

//  글 쓰기 이렇게 하는거 맞나....
//	@RequestMapping(value = "/write", method= {RequestMethod.POST})
//	public ModelAndView write(BoardVO boardVO,ModelAndView mav) throws Exception {
//		log.info("write()실행");
//		communityService.writeBoard(boardVO);
//		mav.setViewName("community/qnapage");
//		return mav;
//	}

	// 여기서부턴 댓글기능입니다... 아직..이에요.. xml에서 resultMap도 수정해야하구요...

}
