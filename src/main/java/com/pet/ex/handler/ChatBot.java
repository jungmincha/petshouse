package com.pet.ex.handler;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatBot {
	
	private final Map<String, String> BASIC_QUESTION = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			
			put("1.배송 문의","<strong>[배송 안내]</strong><br>" + "펫츠하우스는 대한민국 택배 no.1 우체국택배를 이용하여<br>"
					+ "가장 안전하고, 신속하게 배송하여 드립니다 :)<br>"
					+ "대부분 출고 다음날에 바로 도착하며 (주말 제외)<br>"
					+ "지역 택배 기사님들의 일정과 기상상황에 따라 <br>변동이 있을 수 있습니다.<br>"
					+ "기본 배송 준비일은 입고지연 상품 제외, <br>2~5일 정도가 소요되고 있습니다.");
			put("2.교환/환불 문의","<strong>[교환/환불 안내]</strong><br>"
					+ "물품 수령 후(택배 도착일자 기준) 7일 이내에 1:1 채팅방 또는 고객센터 [070-7000-0000]<br>"
					+ "로 반드시 접수 해주세요. 글쓰기시 양식이 자동으로 등록되어 있으며, <br>사전에 신청해 주신 상품에 한해서만 교환/반품이 가능합니다.<br>"
					+ "접수 시 펫츠하우스에서 우체국 택배 회수접수를 도와드리고 있습니다.<br>"
					+ "<br>"
					+ "*패킹하여 보내실 때는 물품 수령시와 동일하게 포장해 주세요."
					+ "<br>택에 손상이 있는 경우에는 반품과 교환이 모두 불가합니다."
					+ "성함,주소,전화번호,보내시는 상품,사유등 반품카드 양식에 맞게 적어 보내주셔야 처리가 가능합니다.");
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