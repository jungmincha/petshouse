package com.pet.ex.vo;

import org.springframework.boot.test.context.SpringBootTest; 
import static org.junit.jupiter.api.Assertions.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class PlikeVOTest {

	//주입
	private int plike_id = 200;
	private int count = 60000;
	private MemberVO memberVO;
	private BoardVO boardVO;
	
	PlikeVO plikeVO = new PlikeVO(plike_id ,count, memberVO , boardVO);
	
	@Test
	public void testplikeVO() {
		assertNotNull(plikeVO);
		log.info("plikeVO test");
	}

}



