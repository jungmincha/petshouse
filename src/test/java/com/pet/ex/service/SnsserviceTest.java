package com.pet.ex.service;

import static org.junit.jupiter.api.Assertions.*;
 
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.CategoryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@Slf4j
public class SnsserviceTest {
	
	@Autowired
	private SnsService service;
	
	@Test
	public void testSnsService() {	
		
		assertNotNull(service);
		log.info("snsService");
		 
	}

	@Test
	public void modifySnsTest() {
		
		BoardVO boardVO = new BoardVO();
		CategoryVO categoryVO = new CategoryVO();
		boardVO.setCategoryVO(categoryVO);
		
		boardVO.setContent("테스트수정");
		boardVO.setHashtag("#고양이");
		categoryVO.setCategory_id(3);	
		boardVO.setBoard_id(5287);
		service.modifySns(boardVO);

 
	}
}


