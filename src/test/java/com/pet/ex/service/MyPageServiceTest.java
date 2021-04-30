package com.pet.ex.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.PayGoodsVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@Slf4j
@SpringBootTest
public class MyPageServiceTest {

	@Autowired
	private MyPageService myPageService;

	@Test // Mapservice가 null이 아니면 성공
	public void myPageService() {
		assertNotNull(myPageService);
		log.info("myPageService");
	}

	@Test
	public void insertReviewTest() {
		BoardVO boardVO = new BoardVO();
		boardVO.setContent("sdfds");
		boardVO.getMemberVO().setMember_id("eril1024@gmail.com");
		boardVO.setRatescore(3);
		boardVO.getGoodsVO().setGoods_id(149);
		myPageService.insertReview(boardVO);
	}

	@Test
	public void insertPayGoods() {
		PayGoodsVO payGoodsVO = new PayGoodsVO();
		payGoodsVO.setAmount(1);
		payGoodsVO.setPay_id(1041);
		payGoodsVO.getBoardVO().setBoard_id(4325);
		payGoodsVO.setPcolor("red");
		payGoodsVO.setPsize("XL");
		myPageService.insertPayGoods(payGoodsVO);

	}

}
