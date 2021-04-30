package com.pet.ex.controller;



import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;



@RunWith(SpringJUnit4ClassRunner.class)
@AutoConfigureMockMvc
@SpringBootTest
public class SnsControllerTest {
	
	 @Setter(onMethod_ = { @Autowired })
	   private WebApplicationContext ctx;
	   
	   private MockMvc mockMvc;


	   @Before
	   public void setup() {
	      this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	   }
	    
		@Test
		public void SNSTest() throws Exception {
			
			mockMvc.perform(MockMvcRequestBuilders.get("/commu/sns"))
			 .andExpect(MockMvcResultMatchers.status().isOk())
		        .andDo(MockMvcResultHandlers.print());
			
		}
		


	   @Test
		public void write_viewTest() throws Exception {
		   
			mockMvc.perform(get("/commu/sns/write_view"))
				.andExpect(status().isOk())
				.andDo(print())
				.andExpect(forwardedUrl("/WEB-INF/views/sns/sns_write.jsp"));

		}
	   
	   
		@Test
		public void deleteCommentTest() throws Exception {
			
			mockMvc.perform(delete("/commu/sns/comment/delete/4367"))
			.andExpect(status().isOk())
			.andDo(print());
			
		}
 
	  
    
}