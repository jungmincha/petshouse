package com.pet.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.ex.mapper.MyPageMapper;
import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PayGoodsVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.PointVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;

	// 장바구니 목록 상품 가져오기
	@Override
	public BoardVO getBoard(String board_id) {
		log.info("getBoard()");
		return myPageMapper.getBoard(board_id);
	}

	// 사용가능한 포인트 가져오기
	@Override
	public PointVO getPoint(String member_id) {
		log.info("getPoint()");
		return myPageMapper.getPoint(member_id);
	}

	// 결제 완료 후 pay테이블에 정보 저장 및 포인트 사용 내역 저장
	@Override
	public void insertPay(PayVO pay) {
		log.info("insertPay()");
		myPageMapper.insertPay(pay);
		myPageMapper.insertUsePoint(pay);
		myPageMapper.insertEarningPoint(pay);
	}

	// 결제 완료 후 pay_id 가져오기
	@Override
	public PayVO getPay_id(String member_id) {
		log.info("getPay_id()");
		return myPageMapper.getPay_id(member_id);
	}

	// 결제 완료 후 payGoods테이블에 상품 목록 저장
	@Override
	public void insertPayGoods(PayGoodsVO payGoods) {
		log.info("insertPayGoods()");
		myPageMapper.insertPayGoods(payGoods);
	}

	// 주문 리스트 불러오기
	@Override
	public List<PayVO> listOrder(Criteria cri) {
		// TODO Auto-generated method stub
		return myPageMapper.listOrder(cri);
	}

	@Override
	public int getPayTotal() {
		// TODO Auto-generated method stub
		return myPageMapper.getPayTotal();
	}

}
