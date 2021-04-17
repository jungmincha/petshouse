package com.pet.ex.handler;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatBot {
	
	private final Map<String, String> BASIC_QUESTION = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			put("1.상품 문의","관리자의 상품 문의 응답");
			put("2.배송 문의","관리자의 배송 문의 응답");
			put("3.환불/교환 문의","관리자의 환불/교환 문의 응답");
			put("3.상담원 연결","상담원 연결 중입니다.");
		}
	});
	
	public boolean isBasicQuestion(String msg) {
		if(BASIC_QUESTION.get(msg) != null) {    // 특정 메세지에 따라 로직 처리
			return true;
		} else {
			return false;
		}
	}
	
	public String basicAnswer(String msg) {
		String answer = BASIC_QUESTION.get(msg);
		String response = "{\"type\":\"message\",\"username\":\"펫츠하우스\",\"msg\":\"" + answer + "\"}";
		log.info(answer);
		log.info(response);
		return response;
	}
}