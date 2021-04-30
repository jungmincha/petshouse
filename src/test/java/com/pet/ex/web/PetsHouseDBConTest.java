package com.pet.ex.web;
 
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
	@SpringBootTest
	class PetsHouseDBConTest {
		
		private static final String driver = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
		private static final String url = "jdbc:log4jdbc:oracle:thin:@DB202103171352_low?TNS_ADMIN=/wallet";
		private static final String user = "ADMIN";
		private static final String pw = "Pethouse1234";
		
		@Test
		void contextLoads() throws ClassNotFoundException {
			
			Class.forName(driver);
			
			try(Connection con = DriverManager.getConnection(url, user, pw)){
				log.info("DB 연결 SUCCESS");
			} catch(Exception e) {
				fail(e.getMessage());
			}
		}

}
