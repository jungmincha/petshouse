package com.pet.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;
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

	// payGoods리스트 가져오기
	public List<PayGoodsVO> listPayGoods(int pay_id);

	// 결제 상태별 주문 리스트
	public List<PayVO> listPaystateOrder(Criteria cri, String member_id, String paystate_id);

	// 결제 상태별 갯수 가져오기
	public int getPaystateTotal(String member_id, int paystate_id);

	// 리뷰 작성
	public void insertReview(BoardVO boardVO);

	// 리뷰 이미지 저장
	public void insertImg(ImageVO imageVO, int board_id);

	// 리뷰 작성 후 포인트 저장
	public void insertPoint(int pscore, int pointtype_id, String member_id);

	// 결제 취소 후 결제상태 변경
	public void updatePayCancel(String receipt_id);

	// 결제내역 가져오기
	public PayVO getPay(String pay_id);

	// 가장 최신의 리뷰게시물 1개 가져오기
	public BoardVO getReview();

	// 회원 정보 수정
	public void updateMember(MemberVO member);

	// 포인트 리스트
	public List<PointVO> getPointList(String member_id);

	// 포인트 리스트(날짜)
	public List<PointVO> getPointListByDate(String member_id, String startDate, String endDate, Criteria cri);

	// 회원 탈퇴
	public void deleteMember(String member_id);

	// 회원 정보 수정 (비번포함x)
	public void updateMemberNoPw(MemberVO member);

	// 포인트 토탈 계산(날짜별)
	public int getPointTotalByDate(String member_id, String startDate, String endDate);

	// 구매확정 및 포인트 지급
	public void updatePaystate_id(String pay_id);

	public void updatePayGoodsReview(String paygoods_id);

}
