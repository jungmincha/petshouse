package com.pet.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PayGoodsVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.PointVO;

@Mapper
public interface MyPageMapper {
	public BoardVO getBoard(String board_id);

	public PointVO getPoint(String member_id);

	// 결제 후 정보 저장
	public void insertPay(PayVO pay);

	// 최신 결제정보를 가져옴(1개)
	public PayVO getPay_id(String member_id);

	// 결제 후 payGoods에 정보 저장
	public void insertPayGoods(PayGoodsVO payGoods);
}
