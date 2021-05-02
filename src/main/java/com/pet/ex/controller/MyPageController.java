package com.pet.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pet.ex.bootPay.BootpayApi;
import com.pet.ex.bootPay.model.Cancel;
import com.pet.ex.page.Criteria;
import com.pet.ex.page.PageVO;
import com.pet.ex.service.LoginService;
import com.pet.ex.service.MyPageService;
import com.pet.ex.service.SecurityService;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PayGoodsVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.PointVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private LoginService loginservice;

	// 장바구니 목록 페이지 이동
	@GetMapping("/cart")
	public ModelAndView cart(ModelAndView mav, HttpServletRequest request, HttpSession session) {
		log.info("/myPage/cart");
		mav.setViewName("/myPage/cart");
		return mav;
	}

	// 장바구니 목록 불러오기 (ajax)
	@PostMapping(value = "/cartList", produces = "application/json; charset=utf8")
	public List<BoardVO> cartList2(@RequestBody List<Map<String, Object>> param) {
		log.info("/myPage/cartList");
		List<BoardVO> board = new ArrayList<BoardVO>();
		for (Map<String, Object> cart : param) {
			board.add(myPageService.getBoard((String) cart.get("board_id")));
		}
		return board;
	}

	// 결제 페이지 이동
	@GetMapping("/payPage")
	public ModelAndView pay(ModelAndView mav, Authentication authentication) {
		String id = authentication.getPrincipal().toString();
		mav.addObject("point", myPageService.getPoint(id));
		mav.addObject("member", securityService.getMember(id));
		mav.setViewName("/myPage/payPage");
		return mav;
	}

	// 결제 후 결제 정보 삽입
	@PostMapping("/payPage/insert")
	public ModelAndView insertPay(ModelAndView mav, PayVO pay, HttpServletRequest request, String payname) {
		log.info("/payPage/insert");
		String[] amounts = request.getParameterValues("amount");
		String[] board_ids = request.getParameterValues("board_id");
		String[] psizes = request.getParameterValues("psize");
		String[] pcolors = request.getParameterValues("pcolor");
		myPageService.insertPay(pay);
		// 해당아이디의 최신 결제내역을 가져옴
		PayVO payVO = myPageService.getPay_id(pay.getMemberVO().getMember_id());

		// payGoods에 정보 저장
		PayGoodsVO payGoodsVO = new PayGoodsVO();

		for (int i = 1; i < amounts.length; i++) {
			payGoodsVO.setAmount(Integer.parseInt(amounts[i]));
			payGoodsVO.setPcolor(pcolors[i]);
			payGoodsVO.setPsize(psizes[i]);
			payGoodsVO.getBoardVO().setBoard_id(Integer.parseInt(board_ids[i]));
			payGoodsVO.setPay_id(payVO.getPay_id());
			myPageService.insertPayGoods(payGoodsVO);

		}
		mav.addObject("pay", myPageService.getPay_id(pay.getMemberVO().getMember_id()));
		mav.addObject("payname", payname);
		mav.setViewName("/myPage/paySuccess");
		return mav;
	}

	// 주문 리스트 조회
	@GetMapping("/orderList")
	public ModelAndView orderList(ModelAndView mav, Authentication authentication, String paystate_id) {

		String member_id = authentication.getPrincipal().toString();
		List<Integer> payCounts = new ArrayList<Integer>();
		payCounts.add(myPageService.getPayTotal(member_id));
		for (int i = 1; i <= 8; i++) {
			payCounts.add(myPageService.getPaystateTotal(member_id, i));
		}

		if (paystate_id != null && paystate_id.equals("5")) {
			mav.addObject("paystate", 5);
		}
		mav.addObject("payCounts", payCounts);
		mav.setViewName("/myPage/orderList");

		return mav;
	}

	// 전체 주문 리스트 조회(ajax)
	@GetMapping("/orderList/ajax")
	public Map<String, Object> orderListAjax(Criteria cri, Authentication authentication) {
		String member_id = authentication.getPrincipal().toString();
		List<PayVO> pay = new ArrayList<PayVO>();
		Map<String, Object> payAjax = new HashMap<String, Object>();

		pay = myPageService.listOrder(cri, member_id);
		int total = myPageService.getPayTotal(member_id);

		for (PayVO dto : pay) {
			dto.setPayGoodsVO(myPageService.listPayGoods(dto.getPay_id()));

		}
		payAjax.put("pay", pay);
		payAjax.put("pageMaker", new PageVO(cri, total));
		return payAjax;
	}

	// paystate_id별 주문 리스트 조회(ajax)
	@GetMapping("/orderList/ajax/{paystate_id}")
	public Map<String, Object> orderList(Criteria cri, Authentication authentication,
			@PathVariable("paystate_id") String paystate_id) {
		String member_id = authentication.getPrincipal().toString();
		List<PayVO> pay = new ArrayList<PayVO>();
		Map<String, Object> payAjax = new HashMap<String, Object>();

		pay = myPageService.listPaystateOrder(cri, member_id, paystate_id);
		int total = myPageService.getPaystateTotal(member_id, Integer.parseInt(paystate_id));

		for (PayVO dto : pay) {
			dto.setPayGoodsVO(myPageService.listPayGoods(dto.getPay_id()));
		}
		payAjax.put("pay", pay);
		payAjax.put("pageMaker", new PageVO(cri, total));
		return payAjax;
	}

	// 리뷰 작성
	@PostMapping("/orderList/review/insert")
	public ModelAndView insertReview(MultipartHttpServletRequest multi, Authentication authentication, ModelAndView mav,
			BoardVO boardVO, String paystate_id) throws IllegalStateException, IOException {
		log.info("myPage/orderList/review/insert");
		String member_id = authentication.getPrincipal().toString();

		boardVO.getMemberVO().setMember_id(member_id);
		if (multi.getFile("file").getOriginalFilename().equals("")) {
			myPageService.insertPoint(100, 4, member_id);
			boardVO.setTitle(null);
			myPageService.insertReview(boardVO);

		} else {
			String path = multi.getSession().getServletContext().getRealPath("/static/img/member/review");
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
				String thumbnail = uuid + "." + ext;
				String savePath = path + "\\" + thumbnail; // 저장 될 파일 경로
				mf.get(i).transferTo(new File(savePath)); // 파일 저장
				boardVO.setTitle(thumbnail);
			}
			myPageService.insertReview(boardVO);
			myPageService.insertPoint(500, 5, member_id);
		}

		mav.addObject("paystate", paystate_id);

		// orderList페이지
		List<Integer> payCounts = new ArrayList<Integer>();
		payCounts.add(myPageService.getPayTotal(member_id));

		for (int i = 1; i <= 8; i++) {
			payCounts.add(myPageService.getPaystateTotal(member_id, i));
		}

		mav.addObject("payCounts", payCounts);
		mav.setViewName("/myPage/orderList");
		return mav;
	}

	// 결제 유효성 체크(ajax)
	@PostMapping("/orderList/payCheck/{receipt_id}")
	public JSONObject payCheck(@PathVariable("receipt_id") String receipt_id, String name, String reason)
			throws Exception {
		BootpayApi api = new BootpayApi("6076c93a5b2948001d07b41e", "n1PS3ICdEr1e8ndCigcSJ7yDrKEYqI4SQWDjc9QZhOM=");
		api.getAccessToken();
		String str = null;
		try {
			HttpResponse res = api.verify(receipt_id);
			str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			System.out.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(str);
		JSONObject jsonObj = (JSONObject) obj;

		return jsonObj;
	}

	// 결제 취소(ajax)
	@PostMapping("/orderList/payCancel/{receipt_id}")
	public JSONObject payCancel(@PathVariable("receipt_id") String receipt_id, String name, String reason)
			throws Exception {
		BootpayApi api = new BootpayApi("6076c93a5b2948001d07b41e", "n1PS3ICdEr1e8ndCigcSJ7yDrKEYqI4SQWDjc9QZhOM=");
		api.getAccessToken();
		Cancel cancel = new Cancel();
		cancel.receipt_id = receipt_id;
		cancel.name = name;
		cancel.reason = reason;
		String str = null;
		try {
			HttpResponse res = api.cancel(cancel);
			str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			System.out.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(str);
		JSONObject jsonObj = (JSONObject) obj;

		if (jsonObj.get("status").toString().equals("200")) {
			System.out.println("취소 성공 - DB실행");
			myPageService.updatePayCancel(receipt_id);
		}
		return jsonObj;
	}

	// 주문 상세 페이지(팝업창)
	@GetMapping("/orderList/popup/{pay_id}")
	public ModelAndView orderPopup(ModelAndView mav, @PathVariable("pay_id") String pay_id, String receipt_id)
			throws Exception {
		PayVO pay = myPageService.getPay(pay_id);

		BootpayApi api = new BootpayApi("6076c93a5b2948001d07b41e", "n1PS3ICdEr1e8ndCigcSJ7yDrKEYqI4SQWDjc9QZhOM=");
		api.getAccessToken();
		String str = null;
		try {
			HttpResponse res = api.verify(receipt_id);
			str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(str);
		JSONObject jsonObj = (JSONObject) obj;

		mav.addObject("pay", pay);
		mav.addObject("payDetail", jsonObj);
		mav.setViewName("/myPage/orderListPopup");
		return mav;
	}

	// 회원 정보 수정 페이지 이동
	@GetMapping("/updateMember")
	public ModelAndView updateMember_view(ModelAndView mav) {
		log.info("/myPage/updateMember");
		mav.addObject("category", loginservice.listCategory());
		mav.setViewName("/myPage/updateMember");
		return mav;
	}

	// 회원정보수정 내역 업데이트
	@PostMapping("/updateMember/insert")
	public ModelAndView updateMemeber(MultipartHttpServletRequest multi, ModelAndView mav, MemberVO member,
			ImageVO imageVO) throws IllegalStateException, IOException {
		log.info("/myPage/updateMember/insert");
		if (multi.getFile("file").getOriginalFilename().equals("")) {

			myPageService.updateMember(member);
		} else {
			String path = multi.getSession().getServletContext().getRealPath("/static/img/member/profile");
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
				String thumbnail = uuid + "." + ext;
				String savePath = path + "\\" + thumbnail; // 저장 될 파일 경로
				mf.get(i).transferTo(new File(savePath)); // 파일 저장
				member.setThumbnail(thumbnail);
			}
			myPageService.updateMember(member);
		}

		mav.setViewName("redirect:/login/logout");
		return mav;
	}

	// 회원 탈퇴
	@GetMapping("/updateMember/delete")
	public String deleteMember(Authentication authentication) {
		String member_id = authentication.getPrincipal().toString();
		System.out.println("실행");
		myPageService.deleteMember(member_id);
		return "삭제완료";
	}

	// 포인트 내역 페이지 이동
	@GetMapping("/pointList")
	public ModelAndView pointList(ModelAndView mav, Authentication authentication) {
		String member_id = authentication.getPrincipal().toString();
		mav.addObject("pointSum", myPageService.getPoint(member_id));
		mav.setViewName("/myPage/pointList");
		return mav;
	}

	// 포인트 리스트 가져오기(ajax)
	@GetMapping("/pointList/ajax")
	public Map<String, Object> pointListAjax(Authentication authentication, String startDate, String endDate,
			Criteria cri) {
		String member_id = authentication.getPrincipal().toString();
		Map<String, Object> pointAjax = new HashMap<String, Object>();
		int total = myPageService.getPointTotalByDate(member_id, startDate, endDate, cri);
		List<PointVO> pointList = new ArrayList<PointVO>();
		pointList = myPageService.getPointList(member_id, startDate, endDate, cri);

		pointAjax.put("pointList", pointList);
		pointAjax.put("pageMaker", new PageVO(cri, total));
		return pointAjax;
	}

	// 구매확정 및 포인트 지급
	@PostMapping("/orderList/orderSuccess/{pay_id}")
	public void orderSuccess(@PathVariable String pay_id) {
		myPageService.updatePaystate_id(pay_id);
	}

}
