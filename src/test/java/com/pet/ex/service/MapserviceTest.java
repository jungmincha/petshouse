package com.pet.ex.service;


import static org.junit.jupiter.api.Assertions.assertNotNull;  

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.pet.ex.page.Criteria;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PlikeVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@Slf4j
@SpringBootTest
public class MapserviceTest {
	
	@Autowired
	private MapService service;

	@Test//Mapservice가 null이 아니면 성공
	public void testMapService() {
		assertNotNull(service);
		log.info("testMapService");
	}
	
	

	
	@Test//memberVO가 담긴 insertLoc서비스 체크
	public void MemberVOTest() {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setMember_id("test_member_id");
		memberVO.setLocation("test_location");	
		service.insertLoc(memberVO);
		
	}
	
	@Test//plikeVO가 담긴 getLikelist서비스 체크
	public void PlikeVOTest() {
		PlikeVO plikeVO = new PlikeVO(); 
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_id(2323);
	
		plikeVO.setPlike_id(232);
		plikeVO.setCount(0);
		plikeVO.setBoardVO(boardVO);
		plikeVO.setMemberVO(null);
			
		service.getLikelist(plikeVO);
		
	}
	
	

	

}
