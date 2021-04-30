package com.pet.ex.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.MemberVO;
import com.pet.ex.vo.PointVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc 
@Slf4j
public class HomeServiceTest {
	
	@Autowired
	private HomeService homeservice;
	
		@Test
		public void HomeServiceTest() {
			assertNotNull(homeservice);
			log.info("homeservice");	
		}
		
		
		@Test public void countCommentTest() {
	    	
	    	BoardVO board = new BoardVO();
	    	board.setBoard_id(3000);

	    	homeservice.countComment(board);
	    	log.info("countComment");
		  }
		 

		
	
		
}