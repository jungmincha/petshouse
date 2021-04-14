package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.AdminService;
import com.pet.ex.service.CommunityService;
import com.pet.ex.service.FileService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Slf4j
@RestController
@RequestMapping("/commu")
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// 노하우 메인 페이지 리스트 출력 (검색, 글쓰기,사진업로드, 페이징, 댓글, 수정, 삭제, 조회 필요함)
	@RequestMapping("/tips")
	public ModelAndView tips(Criteria cri, ModelAndView mav) {
		mav.addObject("tips", communityService.getTipsList(cri));
		mav.addObject("rate", communityService.getTipsRate());
		int total = communityService.getTiptal(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("community/tips"); // 파일경로
		return mav;

	}

	// 노하우 특정 글 페이지 출력
	@GetMapping("/tips_view")
	public ModelAndView tips_view(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("tips_view()실행");
		mav.addObject("tips_view", communityService.getTipsview(boardVO.getBoard_id())); // 특정 글 출력
		mav.addObject("comment", communityService.getComment(boardVO.getBoard_id()));
		communityService.hit(boardVO.getBoard_id());
		// communityService.hit(boardVO.getBoard_id()); 조회수어쩔거임
		mav.setViewName("community/tips_view");
		return mav;
	}

	// 노하우 동물 글 페이지 출력
	@GetMapping("/tips/pet")
	public List<BoardVO> tips_pet(int category_id, Criteria cri) throws Exception {

		List<BoardVO> list = new ArrayList<BoardVO>();
		if (category_id == 0) {
			list = communityService.getTipsList(cri);
		} else {
			list = communityService.getPetTips(category_id);
		}

		log.info("tips_pet()실행");
		return list;
	}

	// 노하우 글 검색
	@PostMapping("/tipssearch")
	public ModelAndView tsearch(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO)
			throws Exception {
		log.info("tsearch()실행");
		mav.addObject("tsearch", communityService.getTsearch(keyword));
		mav.setViewName("/community/tipssearch");
		return mav;
	}

	// 노하우 글쓰기 페이지
	@GetMapping("/tips_write")
	public ModelAndView tips_write(ModelAndView mav) throws Exception {
		log.info("tips_write()실행");
		mav.setViewName("community/tips_write");
		return mav;
	}

	// 노하우 글 작성
	@PostMapping("/tips")
	public ModelAndView twrite(MultipartHttpServletRequest multi, BoardVO boardVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("twrite()실행");
		communityService.writeTips(boardVO);	

		String path = multi.getSession().getServletContext().getRealPath("/static/img/tips");
		path = path.replace("webapp", "resources");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");

		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
				UUID uuid = UUID.randomUUID();
				// 본래 파일명
				String imgname = mf.get(i).getOriginalFilename();

				String savePath = path + "\\" + imgname; // 저장 될 파일 경로

				mf.get(i).transferTo(new File(savePath)); // 파일 저장

				communityService.fileUpload(imgname);
			}
		}
		mav.setView(new RedirectView("/commu/tips", true));
		return mav;
	}

	// 노하우 글 수정 페이지
	@GetMapping("/tmodify_page")
	public ModelAndView tmodify_page(@RequestParam("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {
		log.info("tmodify_page()실행");
		mav.addObject("tips_view", communityService.getTipsview(boardVO.getBoard_id()));
		mav.setViewName("community/tips_modify");
		return mav;
	}

	// 노하우 글 수정하기
	@PostMapping("/tmodify")
	public ModelAndView tmodify(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("tmodify()실행");
		communityService.tmodify(boardVO);
		mav.setView(new RedirectView("/commu/tips", true));
		return mav;
	}

	// 노하우 글 삭제하기
	@GetMapping("/tdelete")
	public ModelAndView tdelete(@RequestParam("board_id") int board_id, Criteria cri, ModelAndView mav)
			throws Exception {
		log.info("tdelete()실행");
		mav.addObject("tips", communityService.getTipsList(cri));
		communityService.tdelete(board_id);
		mav.setView(new RedirectView("/commu/tips", true));
		return mav;
	}

	// 질문과 답변 메인 페이지 리스트 출력
	@RequestMapping("/qna")
	public ModelAndView qna(Criteria cri, ModelAndView mav) {
		mav.addObject("qna", communityService.getQnaList(cri));
		int total = communityService.getTotal(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("community/qna"); // 파일경로
		return mav;

	}

	// 질문과 답변 동물 글 페이지 출력
	@GetMapping("/qna/pet")
	public List<BoardVO> qna_pet(int category_id, Criteria cri) throws Exception {
		List<BoardVO> list = new ArrayList<BoardVO>();
		if (category_id == 0) {
			list = communityService.getQnaList(cri);
		} else {
			list = communityService.getPetQna(category_id);
		}

		log.info("qna_pet()실행");
		return list;
	}

	// 질문과 답변 특정 글 페이지 출력
	@GetMapping("/qna_view")
	public ModelAndView qna_view(BoardVO boardVO, Criteria cri, ModelAndView mav) throws Exception {
		log.info("qna_view()실행");
		mav.addObject("qna_view", communityService.getQnaview(boardVO.getBoard_id())); // 특정 글 출력
		mav.addObject("comment", communityService.listComment(boardVO.getBoard_id(), cri));
		communityService.hit(boardVO.getBoard_id());
		mav.setViewName("community/qna_view");
		return mav;
	}
	// 질문과 답변 댓글 작성
	@PostMapping("/qna_view/insert")
	public BoardVO insertComment(BoardVO boardVO, @RequestParam("member_id") String member_id) {
		MemberVO member = new MemberVO();
		boardVO.setMemberVO(member);
		boardVO.getMemberVO().setMember_id(member_id);
		communityService.insertComment(boardVO);
		BoardVO comments = communityService.getComment(boardVO.getPgroup());
		System.out.println(comments);
		return comments;
	}

	// 질문과 답변 글 검색
	@PostMapping("/qnasearch")
	public ModelAndView qsearch(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO)
			throws Exception {
		log.info("qsearch()실행");
		mav.addObject("qsearch", communityService.getQsearch(keyword));
		mav.setViewName("/community/qnasearch");
		return mav;
	}

	// 질문과 답변 태그 검색
	@PostMapping("/qnatag")
	public ModelAndView qtag(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO)
			throws Exception {
		log.info("qtag()실행");
		mav.addObject("qtag", communityService.getQtag(keyword));
		mav.setViewName("/community/qnatag");
		return mav;
	}

	// 질문과 답변 글쓰기 페이지
	@GetMapping("/qna_write")
	public ModelAndView qna_write(ModelAndView mav) throws Exception {
		log.info("qna_write()실행");
		mav.setViewName("community/qna_write");
		return mav;
	}

	// 글 작성하기 질문과답변
	@PostMapping("/qna")
	public ModelAndView write(MultipartHttpServletRequest multi,ImageVO imageVO, BoardVO boardVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("write()실행");
		communityService.writeQna(boardVO);
	

		String path = multi.getSession().getServletContext().getRealPath("/static/img/qna");
		path = path.replace("webapp", "resources");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
			
			UUID uuid = UUID.randomUUID();			// 파일명 랜덤으로 변경
			
			String originalfileName = mf.get(i).getOriginalFilename();		  		
  			String ext = FilenameUtils.getExtension(originalfileName);
  			//저장 될 파일명
  			String imgname=uuid+"."+ext; 
		

			String savePath = path + "\\" + imgname; // 저장 될 파일 경로
			
			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			imageVO.setImgname(imgname);
			BoardVO board = communityService.getQnaBoard_id();
			imageVO.getBoardVO().setBoard_id(board.getBoard_id());
			communityService.QnaImgInput(imageVO); 

		}	
		mav.setView(new RedirectView("/commu/qna", true));
		return mav;
	}
	
	//상품 더보기 
	@PostMapping("/morelist")
	public Map<String, Object> tips(Criteria cri) {
		log.info("morelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> tips = communityService.getTipsList(cri);
		list.put("tips", tips);
		return list;
	}

	// 질문과 답변 글 수정 페이지
	@GetMapping("/modify_page")
	public ModelAndView modify_page(@RequestParam("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {
		log.info("modify_page()실행");
		mav.addObject("qna_view", communityService.getQnaview(boardVO.getBoard_id()));
		mav.setViewName("community/qna_modify");
		return mav;
	}

	// 질문과 답변 찐 글 수정하기
	@PostMapping("/modify")
	public ModelAndView modify(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("modify()실행");
		communityService.modify(boardVO);
		mav.setView(new RedirectView("/commu/qna", true));
		return mav;
	}

	// 질문과 답변 글 삭제하기
	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam("board_id") int board_id, Criteria cri, ModelAndView mav)
			throws Exception {
		log.info("delete()실행");
		mav.addObject("qna", communityService.getQnaList(cri));
		communityService.delete(board_id);
		mav.setView(new RedirectView("/commu/qna", true));
		return mav;
	}
	
	// 댓글 더보기
			@PostMapping("/cmorelist")
			public Map<String, Object> comments(@RequestParam("board_id") int board_id,Criteria cri) {
				log.info("commentsmorelist");
				Map<String, Object> list = new HashMap<>();
				List<BoardVO> comments = communityService.getcommentsList(cri, board_id);
				list.put("comments", comments);
				return list;
			}





}
