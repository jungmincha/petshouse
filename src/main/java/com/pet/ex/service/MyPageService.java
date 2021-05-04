package com.pet.ex.service;

import java.util.List;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PayGoodsVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.PointVO;

public interface MyPageService {

	BoardVO getBoard(String board_id);

	PointVO getPoint(String member_id);

	void insertPay(PayVO pay);

	PayVO getPay_id(String member_id);

	void insertPayGoods(PayGoodsVO payGoodsVO);

	List<PayVO> listOrder(Criteria cri, String member_id);

	int getPayTotal(String member_id);

	List<PayGoodsVO> listPayGoods(int pay_id);

	List<PayVO> listPaystateOrder(Criteria cri, String member_id, String paystate_id);

	int getPaystateTotal(String member_id, int paystate_id);

	void insertReview(BoardVO boardVO);

	void insertImg(ImageVO imageVO, int board_id);

	void insertPoint(int pscore, int pointtype_id, String member_id);

	void updatePayCancel(String receipt_id);

	PayVO getPay(String pay_id);

	BoardVO getReview();

	void updateMember(MemberVO member);

	List<PointVO> getPointList(String member_id);

	List<PointVO> getPointList(String member_id, String startDate, String endDate, Criteria cri);

	void deleteMember(String member_id);

	int getPointTotalByDate(String member_id, String startDate, String endDate, Criteria cri);

	void updatePaystate_id(String pay_id);

	void updatePayGoodsReview(String paygoods_id);

}
