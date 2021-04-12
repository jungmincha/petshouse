package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PayGoodsVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.PointVO;

@Mapper
public interface MyPageMapper {
	// 장바구니에 담긴 상품목록 가져오기
	public BoardVO getBoard(String board_id);

	// 사용가능한 포인트 가져옴
	public PointVO getPoint(String member_id);

	// 결제 후 결제 정보 저장
	public void insertPay(PayVO pay);

	// 결제 후 포인트 사용내역 저장
	public void insertUsePoint(PayVO pay);

	// 결제 후 포인트 적립내역 저장
	public void insertEarningPoint(PayVO pay);

	// 최신 결제정보를 가져옴(1개)
	public PayVO getPay_id(String member_id);

	// 결제 후 payGoods에 정보 저장
	public void insertPayGoods(PayGoodsVO payGoods);

	// 주문 리스트 불러오기
	public List<PayVO> listOrder(Criteria cri, String member_id);

	// 주문 리스트 총합
	public int getPayTotal(String member_id);

	public List<PayGoodsVO> listPayGoods(int pay_id);

	public List<PayVO> listPaystateOrder(Criteria cri, String member_id, String paystate_id);

	public Integer allOrderListCount();

	public Integer orderListCount(int paystate_id, String member_id);

}
