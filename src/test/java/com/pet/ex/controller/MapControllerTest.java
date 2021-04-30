package com.pet.ex.controller;



import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.junit.Before;
import org.junit.Test;


import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMultipartHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pet.ex.vo.BoardVO;
import com.pet.ex.vo.BoardtypeVO;
import com.pet.ex.vo.CategoryVO;
import com.pet.ex.vo.GoodsVO;
import com.pet.ex.vo.ImageVO;
import com.pet.ex.vo.MemberVO;

import lombok.Setter;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc 
public class MapControllerTest {
	
	@Autowired
    @Setter(onMethod_ = { @Autowired })
    private WebApplicationContext ctx;
	 ObjectMapper mapper;
	 LocalDateTime now = LocalDateTime.now();
     Timestamp timestamp = Timestamp.valueOf(now);//시간test용 데이터
   
     
     MemberVO memberVO = new MemberVO();
     BoardtypeVO boardtypeVO = new BoardtypeVO();
     GoodsVO goodsVO = new GoodsVO();
     CategoryVO categoryVO = new CategoryVO();

     
    private MockMvc mockMvc;
    
    /*
    MockMvc란? 실제 객체와 비슷하지만 테스트에 필요한 기능만 가지는 가짜 객체를 만들어서
        애플리케이션 서버에 배포하지 않고도 스프링 MVC 동작을 재현할 수 있는 클래스를 의미.
        즉 컨트롤러를 테스트할 수있게 만든 가짜 객체(톰캣이 아닌 가상환경을 만들어서 테스트 진행)
    */


    @Autowired 
    MapController mapController;

   @Before
    public void setup(){//클래스 내에 존재하는 각각의 test를 실행하기 전에 매번 실행한다
	   this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }
   
   
   	@Test
	public void mapTest() throws Exception {//mvc가 잘 작동되는지 확인한다. 
		
		mockMvc.perform(get("/map/home"))//파라미터 값이 없어서 경로만 써주어도 잘 돌아간다.
			.andReturn()
			.getModelAndView()
			.getViewName();
		
	}
   	
	
   	
   	@Test//이동대상 경로를 검증하는 테스트
	public void map_viewTest() throws Exception {
	   
		mockMvc.perform(get("/map/board").param("member_id", "wjdalsck@hs.ac.kr").param("location", "서울특별시 중구 명동"))
			.andExpect(status().isOk())//map/board로 들어가기 위해서 파라미터값이 2개가 필요하다. key value 형태로 param을 써서 표기해줄것
			.andDo(print())
			.andExpect(forwardedUrl("/WEB-INF/views/map/board.jsp"));

	}
   	
   	
   	@Test
	public void map_writeTest() throws Exception {
   		
   		mockMvc.perform(multipart("/map/write")//write할때 이미지 파일 업로드 때문에 multipart로 보내준다
   				.file("uploadfile", "테스트".getBytes())
   				.param("member_id", "wjdalsck@hs.ac.kr")
   	   			.param("location", "서울특별시 중구 명동")
   	   			.param("content", "test")
   	   			.param("hashtag", "일상"))
   				.andReturn()
   				.getModelAndView()
   				.getViewName();

   				
   	
   	
		
	}
   
   	
   	@Test
	public void map_modifyTest() throws Exception {
   		
   		mockMvc.perform(post("/map/modify") //post방식으로 modify해준다.
   				.param("member_id", "wjdalsck@hs.ac.kr")
   	   			.param("location", "서울특별시 중구 명동")
   	   			.param("content", "test")
   	   			.param("hashtag", "일상"))
   				.andReturn()
   				.getModelAndView()
   				.getViewName();
   	}
  
   	
	@Test
	public void map_DeleteTest() throws Exception {
   		
   		mockMvc.perform(delete("/map/delete")
   		
   	   			.param("location", "서울특별시 중구 명동")
   	   			.param("member_id", "sdsdsd")
   	   		.param("board_id", "232")
   				.param("nickname", "2323")) //232번 board_id를 delete해준다
   			.andReturn()
			.getModelAndView()
			.getViewName();
   	}
    
    
}