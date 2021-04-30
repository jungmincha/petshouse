package com.pet.ex.controller;



import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;


import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pet.ex.vo.CategoryVO;

import lombok.Setter;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc 
public class CategoryControllerTest {
	
	@Autowired
    @Setter(onMethod_ = { @Autowired })
    private WebApplicationContext ctx;
	ObjectMapper mapper;
	

    private MockMvc mockMvc;
    
    /*
    MockMvc란? 실제 객체와 비슷하지만 테스트에 필요한 기능만 가지는 가짜 객체를 만들어서
        애플리케이션 서버에 배포하지 않고도 스프링 MVC 동작을 재현할 수 있는 클래스를 의미.
        즉 컨트롤러를 테스트할 수있게 만든 가짜 객체(톰캣이 아닌 가상환경을 만들어서 테스트 진행)
    */


    @Autowired 
    CategoryController categoryController;

   @Before
    public void setup(){//클래스 내에 존재하는 각각의 test를 실행하기 전에 매번 실행한다
	   this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }
   
   
   	@Test
	public void categoryTest() throws Exception {//mvc가 잘 작동되는지 확인한다.
		
		mockMvc.perform(get("/category/home"))
			.andReturn()
			.getModelAndView()
			.getViewName();
		
	}
    
   	
   	@Test//이동대상 경로를 검증하는 테스트
	public void category_viewTest() throws Exception {
	   
		mockMvc.perform(get("/category/home"))
			.andExpect(status().isOk())
			.andDo(print())
			.andExpect(forwardedUrl("/WEB-INF/views/category/home.jsp"));

	}
   	
    @Before
    public void setupSmallCategory(){//클래스 내에 존재하는 각각의 test를 실행하기 전에 매번 실행한다
	   this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	   mapper = new ObjectMapper();
    }
   	
   	
   	@Test
	public void smallcategory_viewTest() throws Exception {
   		mockMvc.perform(post("/category/smallcategory/203")  //post방식으로 url을 처리해준다.
                .contentType(MediaType.APPLICATION_JSON_VALUE)    // json 형식으로 처리해준다.
                .content(mapper.writeValueAsString(         
                        new CategoryVO(
                        		203,
                        		"고양이",
                        		1,

                        		2,
                        		"사료"
                                ))))
                .andExpect(status().isOk()) //상태값이 ok
                .andDo(print())   
                .andExpect(forwardedUrl("/WEB-INF/views/category/smallcategory.jsp"));
   				//해당경로까지를 test
		
	}
  
  
  
    
    
}