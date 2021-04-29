package com.pet.ex.vo;

import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class FollowVOTest {

	//주입
	private int follow_id = 300;
	private String follower_id = "jinho";
	private MemberVO memberVO;
	
	FollowVO followVO = new FollowVO(follow_id, follower_id, memberVO);
	
	@Test
	public void testfollowVO() {
		assertNotNull(followVO);
		log.info("followVO test");
	}

}



