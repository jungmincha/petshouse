package com.pet.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.pet.ex.service.CommunityService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/commu")
public class CommunityController {

	@Autowired
	private CommunityService service;

	// 노하우 메인 페이지
	@RequestMapping("/tips")
	public ModelAndView tips(Criteria cri, ModelAndView mav) {
		
		mav.addObject("tips", service.getTipsList(cri));
		mav.addObject("rate", service.getTipsRate()); // 인기 노하우 슬라이드
		mav.addObject("tipslistcount", service.getTipsCount());
		mav.setViewName("community/tips");
		return mav;
	}

	// 노하우 특정 글 페이지 출력
	@GetMapping("/tips/{board_id}")
	public ModelAndView tips_view(@PathVariable("board_id") int board_id, BoardVO boardVO,		
		Authentication authentication, PlikeVO plikeVO, Criteria cri, ModelAndView mav) throws Exception {
		log.info("tips_view()실행");
		
		boardVO = service.getBoardInfo(board_id);
		
		int count = service.tcount(board_id);

		mav.addObject("tips_view", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		mav.addObject("count", count);
		service.hit(boardVO.getBoard_id());

		String member_id = "";
		if (authentication != null) {
			member_id = authentication.getPrincipal().toString();
		}
		System.out.println(member_id);
		String present_nickname = service.getPresetnNickname(member_id);// 현재 닉네임

		// 좋아요 start
		// 좋아요 출력

		MemberVO member = new MemberVO();
		plikeVO.setMemberVO(member);
		plikeVO.getMemberVO().setMember_id(member_id);
		plikeVO.getMemberVO().setNickname(present_nickname);
		BoardVO board = new BoardVO();
		plikeVO.setBoardVO(board);
		plikeVO.getBoardVO().setBoard_id(boardVO.getBoard_id());

		// 좋아요 수
		mav.addObject("like_amount", service.getLiketotal(plikeVO.getBoardVO().getBoard_id()));
		// 좋아요 유무 체크
		mav.addObject("likecheck", service.isLike(plikeVO));
		// 좋아요 리스트
		mav.addObject("likelist", service.getLikelist(plikeVO));

		// 좋아요 end

		mav.setViewName("community/tips_view");

		return mav;
	}

	// 노하우 동물 글 페이지 출력
	/*
	 * @GetMapping("/tips/pet") public List<ImageVO> tips_pet(int category_id,
	 * Criteria cri) throws Exception {
	 * 
	 * List<ImageVO> list = new ArrayList<ImageVO>(); if (category_id == 0) { //
	 * 0번이면 전체 리스트를 뿌려준다 list = service.getTipsList(cri); } else { list =
	 * service.getPetTips(category_id); }
	 * 
	 * log.info("tips_pet()실행"); return list; }
	 */

	
	  // 카테고리별 조회
	  @PostMapping("/tips/category/{boardVO.categoryVO.category_id}") 
	  public ModelAndView tipscategoryList(ImageVO imageVO, BoardVO boardVO, Criteria cri,ModelAndView mav) { 
	
		 log.info("tips_categoryList");
		  
		 System.out.println(imageVO.getBoardVO().getCategoryVO().getCategory_id());
		 mav.addObject("rate", service.getTipsRate()); // 인기 노하우 슬라이드
		  
		 mav.addObject("catetips", service.getTipsCategory(imageVO,cri));
		 mav.addObject("catetipsTotal", service.getTipsCatetotal(imageVO));
		 mav.setViewName("community/tips_category");
		  
		  return mav;	  
	  }
	 
	// 카테고리별 글 더보기 
	@PostMapping("/tips/catemorelist/{boardVO.categoryVO.category_id}")
	public Map<String, Object> tipscategorymoreList(BoardVO boardVO, ImageVO imageVO,  Criteria cri) {
		log.info("tipscategorymoreList");
		
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> catetips = service.getTipsCategory(imageVO, cri);
		list.put("catetips", catetips);
		list.put("catetipsTotal", service.getTipsCatetotal(imageVO));
		
		return list;
		
	}
	

	// 노하우 글쓰기 페이지
	@GetMapping("/tips/write")
	public ModelAndView tips_write(ModelAndView mav) throws Exception {
		log.info("tips_write()실행");
		mav.setViewName("community/tips_write");
		return mav;
	}

	// 노하우 글 작성
	@PostMapping("/tips/write")
	public ModelAndView write(MultipartHttpServletRequest multi, BoardVO boardVO, ImageVO imageVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("tipswrite()실행");
		service.writeTips(boardVO);

		String path = multi.getSession().getServletContext().getRealPath("/static/img/tips");
		path = path.replace("webapp", "resources");
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사

			UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경

			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName);
			// 저장 될 파일명
			String imgname = uuid + "." + ext;

			String savePath = path + "\\" + imgname; // 저장 될 파일 경로

			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			imageVO.setImgname(imgname);
			BoardVO board = service.getTipsBoard_id();
			imageVO.getBoardVO().setBoard_id(board.getBoard_id());
			service.ImgInput(imageVO);

		}
		mav.setView(new RedirectView("/commu/tips", true));
		return mav;
	}

	// 노하우 글 수정 페이지
	@GetMapping("/tmodify_page")
	public ModelAndView tmodify_page(@RequestParam("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {
		log.info("tmodify_page()실행");
		
		mav.addObject("tips_view", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		mav.setViewName("community/tips_modify");
		
		return mav;
	}

	// 노하우 글 수정하기
	@PostMapping("/tmodify")
	public ModelAndView tmodify(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("tmodify()실행");
		
		service.tmodify(boardVO);
		mav.setView(new RedirectView("/commu/tips", true));
		
		return mav;
	}

	// 노하우 글 삭제하기
	@DeleteMapping("/tdelete/{board_id}")
	public ResponseEntity<String> tipsDelete(BoardVO boardVO, Model model) {
		log.info("delete");
		
		ResponseEntity<String> entity = null;

		try {
			service.ImgDelete(boardVO.getBoard_id());
			service.tipsdelete(boardVO.getBoard_id());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 노하우 댓글 작성
	@PostMapping("/tips_view/insert")
	public BoardVO insertTipsComment(BoardVO boardVO, @RequestParam("member_id") String member_id) {
		MemberVO member = new MemberVO();
		boardVO.setMemberVO(member);
		boardVO.getMemberVO().setMember_id(member_id);
		service.insertTipsComment(boardVO);
		BoardVO tcomment = service.getTipsComment(boardVO.getPgroup());
		System.out.println(tcomment);
		
		return tcomment;
	}

	// 댓글 더보기
	@PostMapping("/tmorelist")
	public Map<String, Object> tipscomment(@RequestParam("board_id") int board_id, Criteria cri) {
		log.info("commentmorelist");
		
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> tcomment = service.getTipsCommentList(board_id, cri);
		list.put("tcomment", tcomment);
		list.put("commentTotal", service.tcount(board_id));
		
		return list;
	}

	// 노하우 더보기
	@PostMapping("/morelist")
	public Map<String, Object> tips(Criteria cri) {
		log.info("morelist");
		
		Map<String, Object> list = new HashMap<>();
		List<ImageVO> tips = service.getTipsList(cri);
		list.put("tips", tips);
		
		return list;
	}

	// 질문과 답변 메인 페이지
	@RequestMapping("/qna")
	public ModelAndView qna(Criteria cri, BoardVO boardVO, ModelAndView mav) {
		
		mav.addObject("qna", service.getQnaList(cri));
		int total = service.getTotal(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("ccount", service.countComment(boardVO));
		mav.setViewName("community/qna");
		
		return mav;

	}

	// 질문과 답변 특정 글 페이지
	@GetMapping("/qna/{board_id}")
	public ModelAndView qna_view(@PathVariable("board_id") int board_id, BoardVO boardVO, Criteria cri,
			ModelAndView mav) throws Exception {
		
		boardVO = service.getQnaInfo(board_id);
		log.info("qna_view()실행");
		mav.addObject("qna_view", service.getQnaBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(board_id));
		int qcount = service.qcount(board_id);
		mav.addObject("qcount", qcount);
		service.hit(boardVO.getBoard_id());
		mav.setViewName("community/qna_view");
		
		return mav;
	}

	// 질문과 답변 동물 글 페이지 출력
	@GetMapping("/qna/pet")
	public List<BoardVO> qna_pet(int category_id, Criteria cri) throws Exception {
		
		log.info("qna_pet()실행");
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		if (category_id == 0) {
			list = service.getQnaList(cri);
		} else {
			list = service.getPetQna(category_id);
		}
		
		return list;
	}

	// 질문과 답변 글쓰기 페이지
	@GetMapping("/qna/write")
	public ModelAndView qna_write(ModelAndView mav) throws Exception {
		log.info("qna_write()실행");
		mav.setViewName("community/qna_write");
		return mav;
	}

	// 글 작성하기 질문과답변
	@PostMapping("/qna/write")
	public ModelAndView write(MultipartHttpServletRequest multi, ImageVO imageVO, BoardVO boardVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		
		log.info("write()실행");
		
		if (multi.getFile("file").getOriginalFilename().equals("")) {
			service.writeQna(boardVO);
		} else {
			service.writeQna(boardVO);
			BoardVO board = service.getQnaBoard_id();
			String path = multi.getSession().getServletContext().getRealPath("/static/img/qna");
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
				String imgname = uuid + "." + ext;
				String savePath = path + "\\" + imgname; // 저장 될 파일 경로
				mf.get(i).transferTo(new File(savePath)); // 파일 저장
				imageVO.setImgname(imgname);

				imageVO.getBoardVO().setBoard_id(board.getBoard_id());
				service.ImgInput(imageVO);
				  System.out.println("test url : "+multi.getSession().getServletContext().getRealPath("static/img/qna"));
			}

		}
		mav.setView(new RedirectView("/commu/qna", true));
		return mav;
	}

	// 질문과 답변 글 검색
	@PostMapping("/qnasearch")
	public ModelAndView qnasearch(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO)
			throws Exception {
		log.info("qsearch()실행");
		
		int qscount = service.qscount(keyword);
		mav.addObject("qscount", qscount);
		mav.addObject("qsearch", service.getQnasearch(keyword));
		mav.setViewName("/community/qnasearch");
		
		return mav;
	}

	// 질문과 답변 태그 검색
	@GetMapping("/qnatag")
	public ModelAndView qtag(@RequestParam("keyword") String keyword, ModelAndView mav, BoardVO boardVO)
			throws Exception {
		log.info("qtag()실행");
		mav.addObject("qtag", service.getQnatag(keyword));
		mav.setViewName("/home/search");
		return mav;
	}

	// 질문과 답변 글 수정 페이지
	@GetMapping("/modify_page")
	public ModelAndView modify_page(@RequestParam("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {
		log.info("modify_page()실행");
		mav.addObject("qna_view", service.getQnaBoard(boardVO.getBoard_id()));
		mav.setViewName("community/qna_modify");
		return mav;
	}

	// 질문과 답변 글 수정하기
	@PostMapping("/modify")
	public ModelAndView modify(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("modify()실행");
		service.modify(boardVO);
		mav.setView(new RedirectView("/commu/qna", true));
		return mav;
	}

	// 질문과 답변 댓글 작성
	@PostMapping("/qna_view/insert")
	public BoardVO insertComment(BoardVO boardVO, @RequestParam("member_id") String member_id) {
		MemberVO member = new MemberVO();
		boardVO.setMemberVO(member);
		boardVO.getMemberVO().setMember_id(member_id);
		service.insertComment(boardVO);
		BoardVO comments = service.getComment(boardVO.getPgroup());
		System.out.println(comments);
		return comments;
	}

	// 댓글 더보기
	@PostMapping("/cmorelist")
	public Map<String, Object> comments(@RequestParam("board_id") int board_id, Criteria cri) {
		log.info("commentsmorelist");
		Map<String, Object> list = new HashMap<>();
		List<BoardVO> comments = service.getcommentsList(cri, board_id);
		list.put("comments", comments);
		list.put("commentTotal", service.qcount(board_id));
		return list;
	}

	// 질문과 답변 글 삭제하기
	@DeleteMapping("/qdelete/{board_id}")
	public ResponseEntity<String> qnaDelete(BoardVO boardVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {
			service.ImgDelete(boardVO.getBoard_id());
			service.qnadelete(boardVO.getBoard_id());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 질문과 답변 댓글 삭제
	@DeleteMapping("/qna/comment/delete/{board_id}")
	public ResponseEntity<String> deletQnaComment(BoardVO boardVO) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {

			service.deleteQnaComment(boardVO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 노하우 댓글 삭제
	@DeleteMapping("/tips/comment/delete/{board_id}")
	public ResponseEntity<String> deleteTipsComment(BoardVO boardVO) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {

			service.deleteTipsComment(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 좋아요 기능 -START-
	// 좋아요 입력
	@PostMapping("/tips_view/like/{board_id}")
	public Map<String, Object> like(@PathVariable("board_id") int board_id, Authentication authentication,
			PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO) {
		log.info("LIKE");

		String member_id = authentication.getPrincipal().toString();
		System.out.println(member_id);
		String present_nickname = service.getPresetnNickname(member_id);// 현재 닉네임
		// resultmap에 vo 담아주는 거
		MemberVO member = new MemberVO();
		plikeVO.setMemberVO(member);
		plikeVO.getMemberVO().setMember_id(member_id);
		plikeVO.getMemberVO().setNickname(present_nickname);

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

		} catch (Exception e) {
			e.printStackTrace();
			map.put("SUCCESS", HttpStatus.BAD_REQUEST);
		}
		return map;
	}

	// 좋아요 취소
	@DeleteMapping("/tips_view/likecancel/{board_id}")
	public Map<String, Object> likecancel(@PathVariable("board_id") int board_id, Authentication authentication,
			PlikeVO plikeVO, BoardVO boardVO, MemberVO memberVO) {
		log.info("likecancel");
		String member_id = authentication.getPrincipal().toString();
		System.out.println(member_id);
		String present_nickname = service.getPresetnNickname(member_id);// 현재 닉네임

		// resultmap에 vo 담아주는 거
		MemberVO member = new MemberVO();
		plikeVO.setMemberVO(member);
		plikeVO.getMemberVO().setMember_id(member_id);
		plikeVO.getMemberVO().setNickname(present_nickname);

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
			// BOARD테이블의 plike 숫자 감소
			service.deleteplike(boardVO);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("SUCCESS", HttpStatus.BAD_REQUEST);
		}
		return map;
	}
	// 좋아요 기능 -END-
	
	// ck 에디터에서 파일 업로드
    @PostMapping("/ckUpload")
    public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
     log.info("post CKEditor img upload");
     
     String uploadPath = req.getSession().getServletContext().getRealPath("/static/img/tips");
     uploadPath = uploadPath.replace("webapp", "resources");
     System.out.println("uploadPath  : "+uploadPath);
     // 랜덤 문자 생성
     UUID uid = UUID.randomUUID();
     
     OutputStream out = null;
     PrintWriter printWriter = null;
      
     // 인코딩
     res.setCharacterEncoding("utf-8");
     res.setContentType("application/json");
     
     try {
      
      String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
      byte[] bytes = upload.getBytes();
      
      // 업로드 경로
      String ckUploadPath = uploadPath + File.separator  + uid + "_" +fileName;
      
      out = new FileOutputStream(new File(ckUploadPath));
      out.write(bytes);
      out.flush(); // out에 저장된 데이터를 전송하고 초기화
      
      //String callback = req.getParameter("CKEditorFuncNum");
      printWriter = res.getWriter();
      String fileUrl = "/resources/img/tips/" + uid + "_" +fileName; // 작성화면
      // 업로드시 메시지 출력
//      JsonObject json = new JsonObject();
//      json.addProperty("uploaded", 1);
//      json.addProperty("fileName", fileName);
//      json.addProperty("url", fileUrl);
//      printWriter.println(json);
      printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
      
      printWriter.flush();
      System.out.println("test url : "+req.getSession().getServletContext().getRealPath("static/img/tips"));
      System.out.println("url : "+fileUrl);
      System.out.println("ckUploadPath : "+ckUploadPath);
     } catch (IOException e) { e.printStackTrace();
     } finally {
      try {
       if(out != null) { out.close(); }
       if(printWriter != null) { printWriter.close(); }
      } catch(IOException e) { e.printStackTrace(); }
     }
     
     return; 
    }
	

}
