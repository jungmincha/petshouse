package com.pet.ex.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import org.junit.Before;
import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class MyPageControllerTest {

	@Autowired
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	ObjectMapper mapper;

	private MockMvc mockMvc;

	/*
	 * MockMvc란? 실제 객체와 비슷하지만 테스트에 필요한 기능만 가지는 가짜 객체를 만들어서 애플리케이션 서버에 배포하지 않고도 스프링
	 * MVC 동작을 재현할 수 있는 클래스를 의미. 즉 컨트롤러를 테스트할 수있게 만든 가짜 객체(톰캣이 아닌 가상환경을 만들어서 테스트 진행)
	 */

	@Autowired
	MyPageController myPageController;

	@Before
	public void setup() {// 클래스 내에 존재하는 각각의 test를 실행하기 전에 매번 실행한다
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test // 카트 테스트
	public void cartTest() throws Exception {

		mockMvc.perform(get("/myPage/cart")).andReturn().getModelAndView().getViewName();

	}

	@Test // 구매확정 시 포인트 지급 테스트
	public void orderListTest() throws Exception {

		mockMvc.perform(post("/myPage/orderList/orderSuccess/1041"));

	}

	@Test // orderList 상세정보
	public void orderListPopUpTest() throws Exception {

		mockMvc.perform(get("/myPage/orderList/popup/1041").param("receipt_id", "6088177e0d681b0030e60534")).andReturn()
				.getModelAndView().getViewName();

	}

	@Test // orderList 상세정보
	public void payCancelTest() throws Exception {

		mockMvc.perform(get("/myPage/orderList/payCancel/6088177e0d681b0030e60534")
				.param("receipt_id", "6088177e0d681b0030e60534").param("reason", "반품").param("name", "김준성"));

	}

}