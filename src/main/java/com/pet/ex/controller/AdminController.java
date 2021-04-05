package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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

	@Autowired
	private FileService fileservice;

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
		mav.setViewName("admin/content_view");

		return mav;
	}

	// 상품수정
	@PostMapping("/goods/update")
	public RedirectView goodsModify(GoodsVO goodsVO, ModelAndView mav) throws Exception {

		log.info("상품수정");

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
	public ModelAndView goodsInput( GoodsVO goodsVO, ModelAndView mav)
			throws IllegalStateException, IOException {

		log.info("goods_register");

		/*
		 * String path =
		 * multi.getSession().getServletContext().getRealPath("/static/img/admin"); path
		 * = path.replace("webapp", "resources"); File dir = new File(path); if
		 * (!dir.isDirectory()) { dir.mkdir(); }
		 * 
		 * List<MultipartFile> mf = multi.getFiles("file");
		 * 
		 * if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
		 * 
		 * } else { for (int i = 0; i < mf.size(); i++) { // 파일명 중복 검사 UUID uuid =
		 * UUID.randomUUID(); // 본래 파일명 String imgname =
		 * mf.get(i).getOriginalFilename();
		 * 
		 * String savePath = path + "\\" + imgname; // 저장 될 파일 경로
		 * 
		 * mf.get(i).transferTo(new File(savePath)); // 파일 저장
		 * 
		 * fileservice.fileUpload(imgname); } }
		 */
		service.goodsInput(goodsVO);
		mav.setView(new RedirectView("/admin/goods", true));

		return mav;

	}

	// 상품 게시글 등록
	@GetMapping("/board/registerView")
	public ModelAndView boardInputView(BoardVO boardVO, GoodsVO goodsVO, ModelAndView mav) throws Exception {

		log.info("goods_register_view");

		mav.addObject("goods", service.getNboard());
		mav.setViewName("admin/board_register");

		return mav;
	}

	// 상품 게시글 등록
	@PostMapping("/board/register")
	public ModelAndView boardInput(BoardVO boardVO, GoodsVO goodsVO, ModelAndView mav) throws Exception {

		log.info("goods_register_view");

		service.boardInput(boardVO);
		mav.setView(new RedirectView("/admin/goods", true));

		return mav;
	}

	// 상품게시글 상세조회
	@GetMapping("/goods_detail/{board_id}")
	public ModelAndView goods_view(@PathVariable("board_id") int board_id, BoardVO boardVO, GoodsVO goodsVO,
			CategoryVO categoryVO, StockVO stockVO, ModelAndView mav) throws Exception {

		boardVO = service.getboardInfo(board_id);

		log.info("goods_view");

		mav.addObject("sortBoard", service.getsortBoard(categoryVO));
		mav.addObject("cateBoard", service.getcateBoard());
		mav.addObject("one", service.getRateone(boardVO.getGoodsVO().getGoods_id()));
		mav.addObject("goods", service.getBoard(boardVO.getBoard_id()));
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
}
