package com.pet.ex.handler;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatBot {
	
	private final Map<String, String> BASIC_QUESTION = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			
			put("1.배송 문의","<strong>[단게별 여행 경보]</strong><br>" + "펫츠하우스는 대한민국 택배 no.1 우체국택배를 이용하여\r\n"
					+ "가장 안전하고, 신속하게 배송하여 드립니다 :)\r\n"
					+ "대부분 출고 다음날에 바로 도착하며 (주말 제외)\r\n"
					+ "지역 택배 기사님들의 일정과 기상상황에 따라 변동이 있을 수 있습니다.\r\n"
					+ "기본 배송 준비일은 입고지연 상품 제외, 2~5일 정도가 소요되고 있습니다.");
			put("2.환불/교환 문의","환불 및 교환과 관련된 질문은 상담원과 함께 해주세요.");
			put("3.상담원 연결","<strong>[상담원 연결]</strong><br>"
					+ "상담원 연결 중입니다.<br>"
					+ "상담원 연결까지 약간의 시간이 소요될 수 있습니다.");
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