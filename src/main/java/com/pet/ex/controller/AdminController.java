package com.pet.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pet.ex.service.AdminService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;

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

	@RequestMapping("/goods") // 상품리스트조회
	public ModelAndView list(Criteria cri, CategoryVO categoryVO, ModelAndView mav) {

		mav.setViewName("admin/goods_list");
		mav.addObject("list", service.getList(cri));

		mav.addObject("bar", service.getSidebar());
		mav.addObject("sort", service.getSort(categoryVO));
		
		
		int total = service.getTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));
		return mav;
	}

	@DeleteMapping("/goods/{goods_id}") // 상품삭제/상품게시글삭제/리뷰삭제
	public ResponseEntity<String> delete(GoodsVO goodsVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("delete");

		try {

			service.remove_goods(goodsVO.getGoods_id());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	@GetMapping("/goods/register_view") // 상품등록창
	public ModelAndView goods_register_view(ModelAndView mav) throws Exception {

		log.info("goods_register_view");

		List<CategoryVO> category = null;
		category = service.getCategory();

		mav.setViewName("admin/goods_register");
		mav.addObject("category", JSONArray.fromObject(category));
		mav.addObject("stock", service.getStock());

		return mav;
	}

	@PostMapping("/goods/register") // 상품등록
	public ModelAndView goods_register(GoodsVO goodsVO, ModelAndView mav) throws Exception {

		log.info("goods_register");
		service.input(goodsVO);
		mav.setView(new RedirectView("/admin/goods", true));

		return mav;

	}

	@RequestMapping("/goods/{goods_id}") // 상품조회
	public ModelAndView rest_content_view(@PathVariable("goods_id") int goods_id, GoodsVO goodsVO, ModelAndView mav) {

		log.info("content_view");
		mav.setViewName("admin/content_view");

		List<CategoryVO> category = null;
		category = service.getCategory();
		mav.addObject("category", JSONArray.fromObject(category)); // 카테고리 목록 조회
		mav.addObject("stock", service.getStock()); // 재고상태 목록 조회
		mav.addObject("goods", service.getBoard(goods_id)); // 상품정보 조회
		return mav;
	}

	@PostMapping("/goods/update") // 상품수정
	public RedirectView goods_updete(GoodsVO goodsVO, ModelAndView mav) throws Exception {
		System.out.println(goodsVO.getPsize());
		log.info("상품수정");
		service.modifyGoods(goodsVO);
		//mav.setView(new RedirectView("/admin/goods/{goods_id}", true));
		return new RedirectView("/admin/goods");

	}

	/*
	 * @GetMapping("/store_register") // 상품게시글등록 public String smartEditor() {
	 * return "store_register"; }
	 */

	@GetMapping("/goods_detail/{board_id}") // 상품상세조회
	public ModelAndView goods_view(@PathVariable("board_id") int board_id, BoardVO boardVO, GoodsVO goodsVO,
			StockVO stockVO, ModelAndView mav) throws Exception {

		boardVO = service.getgoodsInfo(board_id);

		log.info("goods_view");
		mav.setViewName("admin/goods_detail");

		System.out.println("board_id");

		mav.addObject("one", service.getRateone(boardVO.getGoodsVO().getGoods_id()));
		mav.addObject("goods", service.getGoods(boardVO.getBoard_id()));

		return mav;

	}

}
