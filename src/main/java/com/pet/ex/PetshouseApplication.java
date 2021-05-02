package com.pet.ex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan // 등록된 리스너 스캔
@SpringBootApplication
public class PetshouseApplication {

	public static void main(String[] args) {
		SpringApplication.run(PetshouseApplication.class, args);

	}

}
