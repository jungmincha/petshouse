package com.pet.ex.service;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PayGoodsVO;
import com.pet.ex.vo.PayVO;
import com.pet.ex.vo.PointVO;

public interface MyPageService {

	BoardVO getBoard(String board_id);

	PointVO getPoint(String member_id);

	void insertPay(PayVO pay);

	PayVO getPay_id(String member_id);

	void insertPayGoods(PayGoodsVO payGoodsVO);

}
