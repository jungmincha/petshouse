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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.service.AdminService;
import com.pet.ex.service.FileService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.StockVO;

import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

//
@Slf4j
@RestController
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService service;

	// 관리자홈
	@GetMapping("/home")
	public ModelAndView adminHome(ModelAndView mav) throws Exception {

		log.info("adminHome");
		mav.setViewName("admin/admin_home");

		return mav;
	}

	// 상품 조회
	@GetMapping("/goods")
	public ModelAndView list(String categoryArrays, Criteria cri, GoodsVO goodsVO, CategoryVO categoryVO,
			ModelAndView mav) throws Exception {

		mav.addObject("list", service.getList(cri));
		mav.addObject("category", service.getCatengoods());
		mav.addObject("sort", service.getSort(categoryVO));

		int total = service.getTotalGoods(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		mav.setViewName("admin/goods_list");

		return mav;
	}

	// 카테고리별 상품조회
	@PostMapping("/goods/category/{category_id}")
	public ModelAndView goodsNcategory(@RequestBody GoodsVO goodsvo, Criteria cri, CategoryVO categoryVO,
			ModelAndView mav) {

		mav.addObject("list2", service.getList2(categoryVO.getCategory_id()));
		mav.addObject("category", service.getCatengoods());
		mav.addObject("sort", service.getSort(categoryVO));
		mav.setViewName("admin/goods_list_category");
		/*
		 * int total = service.getTotal(cri); log.info("total" + total);
		 * mav.addObject("pageMaker", new PageVO(cri, total));
		 */

		return mav;
	}

	@GetMapping("/goods/category")
	public String goodsNcategory() {

		return "admin/goods_list_category";
	}

	// 상품 상세조회
	@RequestMapping("/goods/{goods_id}")
	public ModelAndView content_view(@PathVariable("goods_id") int goods_id, GoodsVO goodsVO, ModelAndView mav) {

		log.info("content_view");

		List<CategoryVO> category = null;
		category = service.getCategory();
		mav.addObject("category", JSONArray.fromObject(category));
		mav.addObject("stock", service.getStock());
		mav.addObject("goods", service.getGoods(goods_id));
		mav.setViewName("admin/goods_modify");

		return mav;
	}

	// 상품수정
	@PostMapping("/goods/update")
	public RedirectView goodsModify(MultipartHttpServletRequest multi, GoodsVO goodsVO, ModelAndView mav)
			throws IllegalStateException, IOException {

		log.info("상품수정");
		String path = multi.getSession().getServletContext().getRealPath("/static/img/admin/goods");

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
				String thumbnail = mf.get(i).getOriginalFilename();

				String savePath = path + "\\" + thumbnail; // 저장 될 파일 경로

				mf.get(i).transferTo(new File(savePath)); // 파일 저장

				goodsVO.setThumbnail(thumbnail);
			}
		}
		service.goodsModify(goodsVO);
		return new RedirectView("/admin/goods");

	}

	// 상품삭제/상품게시글삭제/리뷰삭제
	@DeleteMapping("/goods/{goods_id}")
	public ResponseEntity<String> goodsDelete(GoodsVO goodsVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {
			service.goodsDelete(goodsVO.getGoods_id());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 상품등록뷰
	@GetMapping("/goods/registerView")
	public ModelAndView goods_register_view(ModelAndView mav) throws Exception {

		log.info("goods_register_view");

		List<CategoryVO> category = null;
		category = service.getCategory();

		mav.addObject("category", JSONArray.fromObject(category));
		mav.addObject("stock", service.getStock());
		mav.setViewName("admin/goods_register");

		return mav;
	}

	// 상품등록
	@PostMapping("/goods/register")
	public ModelAndView goodsInput(MultipartHttpServletRequest multi, GoodsVO goodsVO, ModelAndView mav)
			throws IllegalStateException, IOException {

		log.info("goods_register");
		String path = multi.getSession().getServletContext().getRealPath("/static/img/admin/goods");

		path = path.replace("webapp", "resources");

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multi.getFiles("file");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사
			UUID uuid = UUID.randomUUID();
			// 본래 파일명
			String thumbnail = mf.get(i).getOriginalFilename();

			String savePath = path + "\\" + thumbnail; // 저장 될 파일 경로

			mf.get(i).transferTo(new File(savePath)); // 파일 저장

			goodsVO.setThumbnail(thumbnail);
		}

		service.goodsInput(goodsVO);
		mav.setView(new RedirectView("/admin/goods", true));

		return mav;
	}

	// 상품 게시글 등록
	@GetMapping("/board/registerView")
	public ModelAndView boardInputView(BoardVO boardVO, ModelAndView mav) throws Exception {

		log.info("goods_register_view");

		mav.addObject("goods", service.getNboard());
		mav.setViewName("admin/board_register");

		return mav;
	}

	// 상품 게시글 등록
	@PostMapping("/board/register")
	public ModelAndView boardInput(MultipartHttpServletRequest multi, ImageVO imageVO, BoardVO boardVO, GoodsVO goodsVO,
			ModelAndView mav) throws IllegalStateException, IOException {

		log.info("goods_register_view");
		String path = multi.getSession().getServletContext().getRealPath("/static/img/admin/board");

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
			imageVO.getGoodsVO().setGoods_id(boardVO.getGoodsVO().getGoods_id());
			service.detailInput(imageVO);
		}
		service.boardInput(boardVO);
		service.updateCheck(boardVO);
		mav.setView(new RedirectView("/admin/goods", true));

		return mav;

	}

	@GetMapping("/board/{board_id}")
	public ModelAndView boardModify(@PathVariable("board_id") int board_id, BoardVO boardVO, CategoryVO categoryVO,
			ModelAndView mav) {

		log.info("boardModify");

		boardVO = service.getboardInfo(board_id);

		mav.addObject("board", service.getBoard(boardVO.getBoard_id()));
		mav.addObject("img", service.getImg(boardVO.getGoodsVO().getGoods_id()));

		mav.setViewName("admin/board_modify");

		return mav;
	}

	// 상품게시글 상세조회
	@GetMapping("/goods_detail/{board_id}")
	public ModelAndView board_view(@PathVariable("board_id") int board_id, BoardVO boardVO,
			CategoryVO categoryVO, StockVO stockVO, ModelAndView mav, Criteria cri) throws Exception {

		boardVO = service.getboardInfo(board_id);

		log.info("board_view");

		mav.addObject("img", service.getImg(boardVO.getGoodsVO().getGoods_id()));
		mav.addObject("sortBoard", service.getsortBoard(categoryVO));
		mav.addObject("cateBoard", service.getcateBoard());
		mav.addObject("one", service.getRateone(boardVO.getGoodsVO().getGoods_id()));
		mav.addObject("goods", service.getBoard(boardVO.getBoard_id()));

		mav.addObject("review", service.getReviewList(boardVO, cri));
		mav.setViewName("admin/goods_detail");

		return mav;

	}

	// 회원 목록 조회
	@GetMapping("/member_list")
	public ModelAndView memberlist(Criteria cri, ModelAndView mav) {
		log.info("member list");
		mav.addObject("list", service.getMemberlist(cri));
		int total = service.getMembertotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		mav.setViewName("admin/member_list");

		return mav;
	}

	// 회원 상세 조회
	@GetMapping("/member_detail/{member_id}")
	public ModelAndView memberdetail(MemberVO memberVO, ModelAndView mav) throws Exception {
		log.info("member_detail");
		mav.addObject("info", service.getMemberdetail(memberVO.getMember_id()));
		mav.setViewName("admin/member_detail");

		return mav;
	}

	// 회원 삭제
	@DeleteMapping("/member_list/{member_id}")
	public ResponseEntity<String> memberdelete(MemberVO memberVO) {
		ResponseEntity<String> entity = null;
		log.info("member delete");

		try {
			service.memberDelete(memberVO.getMember_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/////////////////////////////////////////////////////////
	// 공지사항
	// 공지사항 리스트 출력
	@RequestMapping("/notice")
	public ModelAndView notice(Criteria cri, ModelAndView mav) {
		mav.addObject("notice", service.getNoticeList(cri));
		int total = service.getNoticeTotal(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("admin/notice"); // 파일경로
		return mav;

	}

	// 공지사항 특정 글 페이지 출력    완료
	@GetMapping("/notice/{board_id}")
	public ModelAndView notice_view(@PathVariable("board_id") int board_id, BoardVO boardVO, ModelAndView mav)
			throws Exception {
		boardVO = service.getBoardInfo1(board_id);
		log.info("notice_view()실행");
		mav.addObject("notice_view", service.getBoard1(boardVO.getBoard_id()));
		mav.addObject("img", service.getNoticeImg(board_id));
		service.hit(boardVO.getBoard_id());
		mav.setViewName("admin/notice_view");
		return mav;
	}

	// 공지사항 글쓰기 페이지
	@GetMapping("/notice/write")
	public ModelAndView notice_write(ModelAndView mav) throws Exception {
		log.info("notice_write()실행");
		mav.setViewName("admin/notice_write");
		return mav;
	}

	// 공지사항 글 작성하기
	@PostMapping("/notice/register")
	public ModelAndView no_write(MultipartHttpServletRequest multi, BoardVO boardVO, ImageVO imageVO, ModelAndView mav)
			throws IllegalStateException, IOException {
		log.info("no_write()실행");
		service.writeNotice(boardVO);

		String path = multi.getSession().getServletContext().getRealPath("/static/img/admin/notice");

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
			BoardVO board = service.getNoticeBoard_id();
			imageVO.getBoardVO().setBoard_id(board.getBoard_id());
			service.NoticeImgInput(imageVO);
		}

		mav.setView(new RedirectView("/admin/notice", true));

		return mav;
	}

	// 공지사항 삭제
	@DeleteMapping("/notice/{board_id}")
	public ResponseEntity<String> noticeDelete(BoardVO boardVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {

			service.noticeDelete(boardVO.getBoard_id());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	// 공지사항 수정 페이지
		@GetMapping("/notice/modify/{board_id}")
		public ModelAndView modify_page(@PathVariable("board_id") int board_id, BoardVO boardVO, ModelAndView mav) {
			
			boardVO = service.getBoardInfo1(board_id);

			mav.addObject("notice_view", service.getBoard1(boardVO.getBoard_id()));
			log.info("modify_page()실행");

			mav.addObject("img", service.getNoticeImg(board_id));

			mav.setViewName("admin/notice_modify");

			return mav;
		}

	// 공지사항 수정 포스트
	@PostMapping("/notice/update")
	public RedirectView noticeModify(MultipartHttpServletRequest multi, BoardVO boardVO, ImageVO imageVO,ModelAndView mav)
			throws IllegalStateException, IOException {

		String path = multi.getSession().getServletContext().getRealPath("/static/img/admin/notice");

		path = path.replace("webapp", "resources");

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		
		List<MultipartFile> mf = multi.getFiles("file");

		for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사

			 // 파일명 랜덤으로 변경

			UUID uuid = UUID.randomUUID(); // 파일명 랜덤으로 변경

			String originalfileName = mf.get(i).getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalfileName);
			// 저장 될 파일명
			String imgname = uuid + "." + ext;

			String savePath = path + "\\" + imgname; // 저장 될 파일 경로

			mf.get(i).transferTo(new File(savePath)); // 파일 저장
			imageVO.setImgname(imgname);
			BoardVO board = service.getNoticeBoard_id();
			imageVO.getBoardVO().setBoard_id(board.getBoard_id());
			service.ImgModify(imageVO);

		}
		service.nodify(boardVO);
		return new RedirectView("/admin/notice");

	}

}
