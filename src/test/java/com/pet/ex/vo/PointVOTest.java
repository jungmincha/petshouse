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
public class PointVOTest {

	private int point_id = 1000;
	private int pscore = 400;

	private PointtypeVO pointtypeVO;
	private MemberVO memberVO;

	private int sum = 10000;

	private int count = 3;
	PointVO pointVO = new PointVO(point_id, pscore, null, pointtypeVO, memberVO, sum, count);

	@Test
	public void testpointVO() {
		assertNotNull(pointVO);
		log.info("pointVO test");
	}

}
