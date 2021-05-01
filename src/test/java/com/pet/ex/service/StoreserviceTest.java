package com.pet.ex.service;

import static org.junit.jupiter.api.Assertions.*; 
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.slf4j.Slf4j;

import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PointVO;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class StoreserviceTest {
	
	@Autowired
	private StoreService storeService;
	
	@Test
	public void testStoreService() {	
		assertNotNull(storeService);
		log.info("storeService");
	}

    @Test
    public void testInsert() {
    	PointVO pointVO = new PointVO();
    	
    	MemberVO member = new MemberVO();
		pointVO.setMemberVO(member);
		
		pointVO.setPscore(3000);
		pointVO.getMemberVO().setMember_id("yy@naver.com");

    	storeService.point(pointVO);
    	log.info("point insert");
    }
}


